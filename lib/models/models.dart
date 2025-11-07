class UserModel {
  final String id;
  final String name;
  final String email;
  final String role; // 'client' | 'operator'
  final double rating;
  final String phone;
  final String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.rating,
    required this.phone,
    this.avatar,
  });
}

class LocationModel {
  final double latitude;
  final double longitude;
  final String address;

  const LocationModel({required this.latitude, required this.longitude, required this.address});
}

class DeliveryRequestModel {
  final String id;
  final String clientId;
  final String? operatorId;
  final String status; // 'pending'|'accepted'|'picking_up'|'in_transit'|'delivered'|'cancelled'
  final LocationModel pickup;
  final LocationModel dropoff;
  final PackageDetails packageDetails;
  final double price;
  final DateTime createdAt;
  final int estimatedDurationMinutes;

  DeliveryRequestModel({
    required this.id,
    required this.clientId,
    required this.operatorId,
    required this.status,
    required this.pickup,
    required this.dropoff,
    required this.packageDetails,
    required this.price,
    required this.createdAt,
    required this.estimatedDurationMinutes,
  });
}

class PackageDetails {
  final double weightKg;
  final double lengthCm;
  final double widthCm;
  final double heightCm;
  final bool fragile;
  final String description;

  const PackageDetails({
    required this.weightKg,
    required this.lengthCm,
    required this.widthCm,
    required this.heightCm,
    required this.fragile,
    required this.description,
  });
}

class DroneTelemetryModel {
  final double latitude;
  final double longitude;
  final double altitudeM;
  final double speedKmh;
  final int batteryPct;
  final double headingDeg;
  final double pitch;
  final double roll;
  final double yaw;
  final int gpsSignal;
  final int timestampMs;

  const DroneTelemetryModel({
    required this.latitude,
    required this.longitude,
    required this.altitudeM,
    required this.speedKmh,
    required this.batteryPct,
    required this.headingDeg,
    required this.pitch,
    required this.roll,
    required this.yaw,
    required this.gpsSignal,
    required this.timestampMs,
  });
}

class FlightControlsModel {
  final double throttle; // -1..1
  final double yaw; // -1..1
  final double pitch; // -1..1
  final double roll; // -1..1

  const FlightControlsModel({
    required this.throttle,
    required this.yaw,
    required this.pitch,
    required this.roll,
  });
}

