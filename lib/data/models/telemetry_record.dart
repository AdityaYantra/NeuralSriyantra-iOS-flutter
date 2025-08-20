import 'package:equatable/equatable.dart';

import 'eeg_sample.dart';
import 'band_power_sample.dart';
import 'accel_sample.dart';
import 'gyro_sample.dart';
import 'heart_rate_sample.dart';
import 'battery_status.dart';
import 'horseshoe_status.dart';

sealed class TelemetryRecord extends Equatable {
  const TelemetryRecord();
}

class TelemetryEeg extends TelemetryRecord {
  const TelemetryEeg(this.sample);
  final EegSample sample;
  @override
  List<Object?> get props => [sample];
}

class TelemetryBandPower extends TelemetryRecord {
  const TelemetryBandPower(this.sample);
  final BandPowerSample sample;
  @override
  List<Object?> get props => [sample];
}

class TelemetryAccel extends TelemetryRecord {
  const TelemetryAccel(this.sample);
  final AccelSample sample;
  @override
  List<Object?> get props => [sample];
}

class TelemetryGyro extends TelemetryRecord {
  const TelemetryGyro(this.sample);
  final GyroSample sample;
  @override
  List<Object?> get props => [sample];
}

class TelemetryHeartRate extends TelemetryRecord {
  const TelemetryHeartRate(this.sample);
  final HeartRateSample sample;
  @override
  List<Object?> get props => [sample];
}

class TelemetryBattery extends TelemetryRecord {
  const TelemetryBattery(this.sample);
  final BatteryStatus sample;
  @override
  List<Object?> get props => [sample];
}

class TelemetryHorseshoe extends TelemetryRecord {
  const TelemetryHorseshoe(this.sample);
  final HorseshoeStatus sample;
  @override
  List<Object?> get props => [sample];
}
