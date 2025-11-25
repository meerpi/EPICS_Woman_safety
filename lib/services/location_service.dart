import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

/// Service to handle GPS location tracking for SOS system
class LocationService {
  static LocationService? _instance;
  
  factory LocationService() {
    _instance ??= LocationService._internal();
    return _instance!;
  }
  
  LocationService._internal();

  /// Check if location permissions are granted
  Future<bool> hasLocationPermission() async {
    final status = await Permission.location.status;
    return status.isGranted;
  }

  /// Request location permissions from user
  /// Returns true if granted, false otherwise
  Future<bool> requestLocationPermission() async {
    // Check if already granted
    if (await hasLocationPermission()) {
      return true;
    }

    // Request permission
    final status = await Permission.location.request();
    
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      // User permanently denied - open app settings
      await openAppSettings();
      return false;
    }
    
    return false;
  }

  /// Check if location services are enabled on device
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Get current high-accuracy location
  /// This is what you use when SOS button is pressed
  Future<Position?> getCurrentLocation() async {
    try {
      // Check service enabled
      if (!await isLocationServiceEnabled()) {
        print('Location services are disabled');
        return null;
      }

      // Check permission
      if (!await hasLocationPermission()) {
        final granted = await requestLocationPermission();
        if (!granted) {
          print('Location permission denied');
          return null;
        }
      }

      // Get HIGH ACCURACY location
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: Duration(seconds: 10),
      );

      print('Location obtained: ${position.latitude}, ${position.longitude}');
      print('Accuracy: ${position.accuracy}m');
      
      return position;
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  /// Calculate distance between two points in meters
  /// Used for proximity filtering (strangers within 1km)
  double calculateDistance(
    double lat1,
    double lng1,
    double lat2,
    double lng2,
  ) {
    return Geolocator.distanceBetween(lat1, lng1, lat2, lng2);
  }

  /// Start listening to continuous location updates
  /// Used for background tracking when user is helping someone
  Stream<Position> getLocationStream() {
    return Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // Update every 10 meters
      ),
    );
  }

  /// Request background location permission (Android 10+)
  Future<bool> requestBackgroundLocationPermission() async {
    if (await Permission.locationAlways.isGranted) {
      return true;
    }

    final status = await Permission.locationAlways.request();
    return status.isGranted;
  }
}
