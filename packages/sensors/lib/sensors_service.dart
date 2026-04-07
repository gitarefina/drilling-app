import 'package:flutter/foundation.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorsService {
  final Stream<AccelerometerEvent> _accelerometerStream;
  final Stream<GyroscopeEvent> _gyroscopeStream;

  // ValueNotifiers to notify UI on changes
  ValueNotifier<List<double>> accelerometer = ValueNotifier([0, 0, 0]); // [x, y, z]
  ValueNotifier<List<double>> gyroscope = ValueNotifier([0, 0, 0]);     // [x, y, z]

  SensorsService({
    Stream<AccelerometerEvent>? accelerometerStream,
    Stream<GyroscopeEvent>? gyroscopeStream,
  })  : _accelerometerStream = accelerometerStream ?? accelerometerEvents,
        _gyroscopeStream = gyroscopeStream ?? gyroscopeEvents;

  void startSensors() {
    _accelerometerStream.listen((event) {
      accelerometer.value = [event.x, event.y, event.z];
    });

    _gyroscopeStream.listen((event) {
      gyroscope.value = [event.x, event.y, event.z];
    });
  }
}