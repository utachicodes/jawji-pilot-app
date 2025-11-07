import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';
import '../services/mock_services.dart';

final mockServicesProvider = Provider<MockServices>((_) => const MockServices());

final telemetryProvider = StreamProvider<DroneTelemetryModel>((ref) {
  final svc = ref.watch(mockServicesProvider);
  return svc.telemetryStream();
});

final availableRequestsProvider = FutureProvider<List<DeliveryRequestModel>>((ref) {
  final svc = ref.watch(mockServicesProvider);
  return svc.fetchAvailableRequests();
});

