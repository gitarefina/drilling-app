import 'package:sensors_plus/sensors_plus.dart';

class SensorsService {
  final Stream<AccelerometerEvent> _accelerometerStream;

  double accelerometer_x = 0, accelerometer_y = 0, accelerometer_z = 0;
  SensorsService({Stream<AccelerometerEvent>? accelerometerStream})
    : _accelerometerStream = accelerometerStream ?? accelerometerEvents;

  void startSensors() {
    _accelerometerStream.listen((event) {
      accelerometer_x = event.x;
      accelerometer_y = event.y;
      accelerometer_z = event.z;
    });
  }
}
