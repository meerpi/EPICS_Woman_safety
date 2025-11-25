from gevent import monkey
monkey.patch_all()

import os
from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_socketio import SocketIO, emit
from sqlalchemy.orm import Session
from sqlalchemy import Column, Integer, String, TIMESTAMP, func, ForeignKey
from sqlalchemy.orm import relationship
from werkzeug.security import generate_password_hash, check_password_hash
import jwt

from models import User, Contact
from database import Base, engine, SessionLocal


# Read secret from environment for security; fallback for local dev
SECRET_KEY = os.getenv("SECRET_KEY", "YOUR_SECRET_KEY")

app = Flask(__name__)
CORS(app)

# Initialize Socket.IO for real-time SOS alerts
# async_mode='gevent' is automatically selected if gevent is installed, but we can be explicit
socketio = SocketIO(app, cors_allowed_origins="*", async_mode='gevent')

# Store connected user sockets for real-time notifications
user_sockets = {}  # {user_id: socket_id}

# Create DB tables
Base.metadata.create_all(bind=engine)


# --------------------------
# HELPER FUNCTIONS
# --------------------------
def get_db():
    """Creates and returns a database session."""
    return SessionLocal()


def create_token(data: dict):
    """Creates JWT access token."""
    return jwt.encode(data, SECRET_KEY, algorithm="HS256")


def decode_token(token: str):
    """Decodes and verifies JWT token."""
    try:
        return jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    except:
        return None


def require_auth(fn):
    """Decorator to protect endpoints with authentication."""

    def wrapper(*args, **kwargs):
        token = request.headers.get("Authorization", "").replace("Bearer ", "")
        decoded = decode_token(token)

        if not decoded or "user_id" not in decoded:
            return jsonify({"error": "Unauthorized"}), 401

        request.user = decoded
        return fn(*args, **kwargs)

    wrapper.__name__ = fn.__name__
    return wrapper


def calculate_distance(lat1, lon1, lat2, lon2):
    """
    Calculate distance between two points using Haversine formula.
    Returns distance in meters.
    """
    from math import radians, cos, sin, asin, sqrt
    
    # Convert to radians
    lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])
    
    # Haversine formula
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    a = sin(dlat/2)**2 + cos(lat1) * cos(lat2) * sin(dlon/2)**2
    c = 2 * asin(sqrt(a))
    
    # Radius of earth in meters
    r = 6371000
    
    return c * r


def send_sms_notification(phone_number, message):
    """
    Send SMS notification via Twilio.
    PLACEHOLDER: Implement when Twilio credentials are available.
    """
    # TODO: Integrate with Twilio
    # from twilio.rest import Client
    # 
    # account_sid = os.getenv('TWILIO_ACCOUNT_SID')
    # auth_token = os.getenv('TWILIO_AUTH_TOKEN')
    # twilio_phone = os.getenv('TWILIO_PHONE_NUMBER')
    # 
    # client = Client(account_sid, auth_token)
    # message = client.messages.create(
    #     body=message,
    #     from_=twilio_phone,
    #     to=phone_number
    # )
    
    print(f"[SMS PLACEHOLDER] Would send to {phone_number}: {message}")
    return True


def send_push_notification(user_id, title, body, data=None):
    """
    Send push notification via Firebase Cloud Messaging.
    PLACEHOLDER: Implement when Firebase credentials are available.
    """
    # TODO: Integrate with Firebase
    # import firebase_admin
    # from firebase_admin import messaging
    # 
    # Get user's FCM token from database
    # db = get_db()
    # user = db.query(User).filter(User.id == user_id).first()
    # if not user or not user.fcm_token:
    #     return False
    # 
    # message = messaging.Message(
    #     notification=messaging.Notification(
    #         title=title,
    #         body=body,
    #     ),
    #     data=data or {},
    #     token=user.fcm_token,
    # )
    # 
    # response = messaging.send(message)
    
    print(f"[PUSH PLACEHOLDER] Would send to user {user_id}: {title} - {body}")
    return True



# --------------------------
# AUTH ROUTES
# --------------------------


@app.post("/signup")
def signup():
    """Registers a new user."""
    data = request.json or {}
    db = get_db()
    try:
        # Accept signup via phone or email. At least one required.
        phone = data.get("phone")
        email = data.get("email")
        full_name = data.get("full_name") or data.get("name") or ""
        password = data.get("password")

        if not password:
            return jsonify({"error": "Password is required"}), 400

        if not phone and not email:
            return jsonify({"error": "Provide phone or email to register"}), 400

        if phone:
            existing = db.query(User).filter(User.phone == phone).first()
            if existing:
                return jsonify({"error": "Phone already registered"}), 400

        if email:
            existing_e = db.query(User).filter(User.email == email).first()
            if existing_e:
                return jsonify({"error": "Email already registered"}), 400

        user = User(
            full_name=full_name or email or phone,
            phone=phone,
            email=email,
            password=generate_password_hash(password),
        )

        db.add(user)
        db.commit()
        db.refresh(user)

        token = create_token({"user_id": user.id, "role": user.role})
        return jsonify({"user_id": user.id, "access_token": token})
    finally:
        db.close()

    # return jsonify({
    #     "message": "User created successfully!",
    #     "user_id": user.id,
    #     "phone": user.phone
    # })


@app.post("/login")
def login():
    """Authenticates user and returns JWT token."""
    data = request.json or {}
    db = get_db()
    try:
        phone = data.get("phone")
        email = data.get("email")
        password = data.get("password")

        if not password:
            return jsonify({"error": "Password required"}), 400

        user = None
        if phone:
            user = db.query(User).filter(User.phone == phone).first()
        elif email:
            user = db.query(User).filter(User.email == email).first()
        else:
            return jsonify({"error": "Provide phone or email to login"}), 400

        if not user or not check_password_hash(user.password, password):
            return jsonify({"error": "Invalid credentials"}), 401

        token = create_token({"user_id": user.id, "role": user.role})
        return jsonify({"access_token": token, "token_type": "bearer"})
    finally:
        db.close()


@app.get("/me")
@require_auth
def me():
    """Returns authenticated user's profile."""
    db = get_db()
    try:
        user = db.query(User).filter(User.id == request.user["user_id"]).first()
        if not user:
            return jsonify({"error": "User not found"}), 404

        return jsonify(
            {
                "id": user.id,
                "full_name": user.full_name,
                "phone": user.phone,
                "email": user.email,
                "role": user.role,
            }
        )
    finally:
        db.close()


# --------------------------
# USER UPDATE ROUTES
# --------------------------


@app.patch("/user/update")
@require_auth
def update_user():
    """Updates user profile details."""
    data = request.json
    db = get_db()
    try:
        user = db.query(User).filter(User.id == request.user["user_id"]).first()
        if not user:
            return jsonify({"error": "User not found"}), 404

        allowed_fields = ["email", "dob", "blood_group", "gender"]

        for field in allowed_fields:
            if field in data:
                setattr(user, field, data[field])

        db.commit()
        db.refresh(user)

        return jsonify({"message": "Profile updated successfully"})
    finally:
        db.close()


# --------------------------
# CONTACT MANAGEMENT
# --------------------------


@app.post("/contacts")
@require_auth
def add_contact():
    """Adds an emergency contact."""
    data = request.json
    db = get_db()
    try:
        contact = Contact(
            user_id=request.user["user_id"],
            name=data.get("name"),
            phone=data.get("phone"),
            relation=data.get("relation", "Unknown"),
        )

        db.add(contact)
        db.commit()

        return jsonify({"message": "Contact added successfully"})
    finally:
        db.close()


@app.get("/contacts")
@require_auth
def list_contacts():
    """Gets all emergency contacts."""
    db = get_db()
    try:
        contacts = (
            db.query(Contact).filter(Contact.user_id == request.user["user_id"]).all()
        )

        return jsonify(
            [
                {"id": c.id, "name": c.name, "phone": c.phone, "relation": c.relation}
                for c in contacts
            ]
        )
    finally:
        db.close()


@app.delete("/contacts/<int:contact_id>")
@require_auth
def delete_contact(contact_id):
    """Deletes a contact."""
    db = get_db()
    try:
        contact = (
            db.query(Contact)
            .filter(
                Contact.id == contact_id, Contact.user_id == request.user["user_id"]
            )
            .first()
        )

        if not contact:
            return jsonify({"error": "Contact not found"}), 404

        db.delete(contact)
        db.commit()

        return jsonify({"message": "Contact removed"})
    finally:
        db.close()



# --------------------------
# SOCKET.IO HANDLERS FOR SOS
# --------------------------

@socketio.on('connect')
def handle_connect():
    """Handle client connection"""
    print(f'Client connected: {request.sid}')

@socketio.on('disconnect')
def handle_disconnect():
    """Handle client disconnection"""
    print(f'Client disconnected: {request.sid}')
    # Remove from user_sockets
    for user_id, sid in list(user_sockets.items()):
        if sid == request.sid:
            del user_sockets[user_id]
            print(f'Removed user {user_id} from active sockets')
            break

@socketio.on('identify')
def handle_identify(data):
    """Register user's socket for targeted messaging"""
    user_id = data.get('user_id')
    if user_id:
        user_sockets[user_id] = request.sid
        print(f'User {user_id} identified with socket {request.sid}')
        emit('identified', {'status': 'success', 'user_id': user_id})

@socketio.on('trigger_sos')
def handle_sos(data):
    """
    Handle SOS alert trigger:
    1. Send SMS to family members (emergency contacts) - regardless of distance
    2. Broadcast alert to ALL connected users - they calculate proximity client-side
    """
    print(f'SOS triggered: {data}')
    
    user_id = data.get('user_id')
    latitude = data.get('latitude')
    longitude = data.get('longitude')
    timestamp = data.get('timestamp')
    message = data.get('message', 'Emergency SOS Alert')
    
    if not all([user_id, latitude, longitude]):
        emit('sos_error', {'error': 'Missing required SOS data'})
        return
    
    db = get_db()
    try:
        # Get user details
        user = db.query(User).filter(User.id == user_id).first()
        if not user:
            emit('sos_error', {'error': 'User not found'})
            return
        
        # Get user's emergency contacts (family members)
        contacts = db.query(Contact).filter(Contact.user_id == user_id).all()
        
        # Prepare alert data
        alert_data = {
            'user_id': user_id,
            'user_name': user.full_name,
            'user_phone': user.phone,
            'latitude': latitude,
            'longitude': longitude,
            'timestamp': timestamp,
            'message': message,
            'google_maps_link': f'https://www.google.com/maps?q={latitude},{longitude}'
        }
        
        print(f'SOS Alert from {user.full_name}: {latitude}, {longitude}')
        print(f'Processing notifications...')
        
        # ========================================
        # 1. NOTIFY EMERGENCY CONTACTS (FAMILY) VIA SMS
        # ========================================
        contacts_notified = 0
        for contact in contacts:
            # Send SMS to each emergency contact
            sms_message = (
                f"🚨 EMERGENCY ALERT 🚨\n\n"
                f"{user.full_name} needs help!\n"
                f"Location: {alert_data['google_maps_link']}\n"
                f"Time: {timestamp}\n\n"
                f"Please check on them immediately!"
            )
            
            if send_sms_notification(contact.phone, sms_message):
                contacts_notified += 1
                print(f"  ✓ SMS sent to {contact.name} ({contact.relation}): {contact.phone}")
        
        print(f'Notified {contacts_notified} emergency contacts via SMS')
        
        # ========================================
        # 2. BROADCAST TO ALL CONNECTED USERS
        # (Client devices will calculate distance and show notification if < 1km)
        # ========================================
        broadcast_count = 0
        for uid, socket_id in user_sockets.items():
            # Don't send to the user who triggered the alert
            if uid != user_id:
                socketio.emit('nearby_sos_alert', alert_data, room=socket_id)
                broadcast_count += 1
        
        print(f'Broadcasted alert to {broadcast_count} connected users')
        print(f'  → Clients will check proximity and notify if within 1km')
        
        # ========================================
        # 3. SEND CONFIRMATION TO TRIGGERING USER
        # ========================================
        emit('sos_confirmed', {
            'status': 'success',
            'message': 'SOS alert sent successfully',
            'contacts_notified': contacts_notified,
            'broadcast_to_users': broadcast_count,
        })
        
        print(f'✓ SOS Processing Complete:')
        print(f'  - {contacts_notified} emergency contacts notified (SMS)')
        print(f'  - {broadcast_count} users will check proximity (client-side)')
        
    finally:
        db.close()


# --------------------------
# TEST ENDPOINT FOR SIMULATING NEARBY SOS
# --------------------------

@app.post("/test/simulate_nearby_sos")
def simulate_nearby_sos():
    """
    Test endpoint to simulate a nearby SOS alert.
    Useful for testing the proximity notification system without multiple devices.
    """
    data = request.json or {}
    
    # You can provide coordinates, or it will use a default location near Bhopal
    test_lat = data.get('latitude', 23.0730)  # ~600m north of your location
    test_lng = data.get('longitude', 76.8600)
    test_user_name = data.get('user_name', 'Test User')
    
    # Create fake alert data
    fake_alert = {
        'user_id': 999,  # Fake user ID
        'user_name': test_user_name,
        'user_phone': '+919999999999',
        'latitude': test_lat,
        'longitude': test_lng,
        'timestamp': datetime.now().isoformat(),
        'message': 'TEST Emergency SOS Alert',
        'google_maps_link': f'https://www.google.com/maps?q={test_lat},{test_lng}'
    }
    
    print(f'🧪 TEST: Simulating nearby SOS from {test_user_name}')
    print(f'📍 Location: {test_lat}, {test_lng}')
    
    # Broadcast to all connected users
    broadcast_count = 0
    for uid, socket_id in user_sockets.items():
        socketio.emit('nearby_sos_alert', fake_alert, room=socket_id)
        broadcast_count += 1
    
    print(f'✓ Broadcasted test alert to {broadcast_count} connected users')
    
    return jsonify({
        'status': 'success',
        'message': 'Test SOS alert broadcasted',
        'alert_data': fake_alert,
        'broadcast_to': broadcast_count
    })


from datetime import datetime


if __name__ == "__main__":
    # Use socketio.run instead of app.run for Socket.IO support
    # Bind to 0.0.0.0 so emulators/devices can reach the server
    # allow_unsafe_werkzeug is not needed/supported with gevent
    socketio.run(app, host="0.0.0.0", port=5000, debug=True)
