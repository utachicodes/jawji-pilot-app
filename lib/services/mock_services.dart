import 'dart:async';
import 'dart:math' as math;
import '../models/models.dart';

class MockServices {
  const MockServices();

  // Emits fake telemetry every 1s (lat/lon jitter, battery drain, speed oscillation)
  Stream<DroneTelemetryModel> telemetryStream({
    double lat = 37.7749,
    double lon = -122.4194,
  }) async* {
    final rnd = math.Random();
    int tick = 0;
    int battery = 92;
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 1));
      tick++;
      battery = math.max(15, battery - (tick % 7 == 0 ? 1 : 0));
      yield DroneTelemetryModel(
        latitude: lat + (rnd.nextDouble() - 0.5) * 0.0005,
        longitude: lon + (rnd.nextDouble() - 0.5) * 0.0005,
        altitudeM: 40 + rnd.nextDouble() * 20,
        speedKmh: 18 + rnd.nextDouble() * 12,
        batteryPct: battery,
        headingDeg: rnd.nextDouble() * 360,
        pitch: (rnd.nextDouble() - 0.5) * 10,
        roll: (rnd.nextDouble() - 0.5) * 10,
        yaw: (rnd.nextDouble() - 0.5) * 10,
        gpsSignal: 85 + rnd.nextInt(15),
        timestampMs: DateTime.now().millisecondsSinceEpoch,
      );
    }
  }

  Future<List<DeliveryRequestModel>> fetchAvailableRequests() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return [
      DeliveryRequestModel(
        id: 'REQ-001',
        clientId: 'C-1',
        operatorId: null,
        status: 'pending',
        pickup: const LocationModel(latitude: 37.789, longitude: -122.41, address: '123 Main St'),
        dropoff: const LocationModel(latitude: 37.783, longitude: -122.43, address: '456 Oak Ave'),
        packageDetails: const PackageDetails(
          weightKg: 2.5,
          lengthCm: 30,
          widthCm: 20,
          heightCm: 15,
          fragile: false,
          description: 'Shoebox',
        ),
        price: 24.50,
        createdAt: DateTime.now(),
        estimatedDurationMinutes: 28,
      ),
      DeliveryRequestModel(
        id: 'REQ-002',
        clientId: 'C-2',
        operatorId: null,
        status: 'pending',
        pickup: const LocationModel(latitude: 37.781, longitude: -122.415, address: '5th St'),
        dropoff: const LocationModel(latitude: 37.792, longitude: -122.407, address: 'Market St'),
        packageDetails: const PackageDetails(
          weightKg: 1.1,
          lengthCm: 18,
          widthCm: 12,
          heightCm: 10,
          fragile: true,
          description: 'Electronics',
        ),
        price: 19.30,
        createdAt: DateTime.now(),
        estimatedDurationMinutes: 18,
      ),
    ];
  }
}

