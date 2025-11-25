import 'package:socket_io_client/socket_io_client.dart' as IO;
import '/services/location_service.dart';

/// Service to handle real-time Socket.IO communication for SOS alerts
class SocketService {
  static SocketService? _instance;
  IO.Socket? _socket;
  final LocationService _locationService = LocationService();
  
  factory SocketService() {
    _instance ??= SocketService._internal();
    return _instance!;
  }
  
  SocketService._internal();

  /// Connect to the backend Socket.IO server
  /// baseUrl should be like 'http://10.0.2.2:5000' for Android emulator
  /// or 'http://192.168.x.x:5000' for physical devices
  void connect(String baseUrl, int userId) {
    if (_socket != null && _socket!.connected) {
      print('Socket already connected');
      return;
    }

    try {
      _socket = IO.io(
        baseUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build(),
      );

      _socket!.connect();

      _socket!.onConnect((_) {
        print('Socket connected successfully');
        // Identify this user to the backend
        _socket!.emit('identify', {'user_id': userId});
      });

      _socket!.onDisconnect((_) {
        print('Socket disconnected');
      });

      _socket!.onConnectError((error) {
        print('Socket connection error: $error');
      });

      _socket!.onError((error) {
        print('Socket error: $error');
      });
    } catch (e) {
      print('Error creating socket: $e');
    }
  }

  /// Trigger an SOS alert with location
  void triggerSOS({
    required int userId,
    required double latitude,
    required double longitude,
    String? message,
  }) {
    if (_socket == null || !_socket!.connected) {
      print('Socket not connected. Cannot trigger SOS.');
      return;
    }

    final sosData = {
      'user_id': userId,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': DateTime.now().toIso8601String(),
      'message': message ?? 'Emergency SOS Alert',
    };

    print('Triggering SOS: $sosData');
    _socket!.emit('trigger_sos', sosData);
  }

  /// Listen for nearby SOS alerts and check proximity client-side
  /// Callback is triggered ONLY if the alert is within proximityMeters
  void listenForNearbySOS({
    required Function(Map<String, dynamic> alertData, double distanceMeters) onNearbyAlert,
    double proximityMeters = 1000, // Default 1km
  }) {
    if (_socket == null) {
      print('Socket not initialized');
      return;
    }

    _socket!.on('nearby_sos_alert', (data) async {
      print('Received SOS broadcast: $data');
      
      if (data is! Map<String, dynamic>) return;
      
      try {
        // Extract alert coordinates
        final alertLat = data['latitude'] as double?;
        final alertLng = data['longitude'] as double?;
        
        if (alertLat == null || alertLng == null) {
          print('Alert missing location data');
          return;
        }
        
        // Get current device location
        final myLocation = await _locationService.getCurrentLocation();
        if (myLocation == null) {
          print('Unable to get my location for proximity check');
          return;
        }
        
        // Calculate distance using LocationService
        final distance = _locationService.calculateDistance(
          myLocation.latitude,
          myLocation.longitude,
          alertLat,
          alertLng,
        );
        
        print('SOS Alert distance: ${(distance/1000).toStringAsFixed(2)}km');
        
        // Only notify if within proximity radius
        if (distance <= proximityMeters) {
          print('🚨 NEARBY EMERGENCY! ${(distance/1000).toStringAsFixed(2)}km away');
          onNearbyAlert(data, distance);
        } else {
          print('Alert too far away (${(distance/1000).toStringAsFixed(2)}km)');
        }
      } catch (e) {
        print('Error processing nearby SOS alert: $e');
      }
    });
  }

  /// Listen for incoming SOS alerts (for family members - direct alerts)
  void listenForFamilyAlerts(Function(Map<String, dynamic>) onAlertReceived) {
    if (_socket == null) {
      print('Socket not initialized');
      return;
    }

    _socket!.on('sos_alert', (data) {
      print('Family SOS Alert received: $data');
      if (data is Map<String, dynamic>) {
        onAlertReceived(data);
      }
    });
  }

  /// Disconnect from socket server
  void disconnect() {
    if (_socket != null) {
      _socket!.disconnect();
      _socket = null;
      print('Socket disconnected manually');
    }
  }

  /// Check if socket is currently connected
  bool get isConnected => _socket?.connected ?? false;
}
