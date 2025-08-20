import '../models/telemetry_record.dart';

abstract class CloudRepository {
  Future<void> uploadBatch(List<TelemetryRecord> batch);
}

/// No-op implementation placeholder for future backend integration.
class NoOpCloudRepository implements CloudRepository {
  @override
  Future<void> uploadBatch(List<TelemetryRecord> batch) async {
    // Intentionally does nothing. Integrate with backend here later.
  }
}
