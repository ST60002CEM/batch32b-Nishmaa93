import 'dart:async';
import 'dart:math';

import 'package:sensors_plus/sensors_plus.dart';

class DoubleShakeDetectorService {
  static const double shakeThresholdGravity = 2.7;
  StreamSubscription? _accelerometerSubscription;

  final void Function() onShake;

  DoubleShakeDetectorService({required this.onShake});

  void startListening() {
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      double gX = event.x / 9.80665;
      double gY = event.y / 9.80665;
      double gZ = event.z / 9.80665;

      double gForce = sqrt(gX * gX + gY * gY + gZ * gZ);

      if (gForce > shakeThresholdGravity) {
        onShake();
      }
    });
  }

  void stopListening() {
    _accelerometerSubscription?.cancel();
  }
}
