import 'package:sensors_plus/sensors_plus.dart';

class SensorsService {
  final Stream<AccelerometerEvent> _accelerometerStream;
  final Stream<GyroscopeEvent> _gyroscopeStream;

  List<double> accelerometer = [0, 0, 0]; // [x, y, z]
  List<double> gyroscope = [0, 0, 0];     // [x, y, z]

  SensorsService({
    Stream<AccelerometerEvent>? accelerometerStream,
    Stream<GyroscopeEvent>? gyroscopeStream,
  })  : _accelerometerStream = accelerometerStream ?? accelerometerEvents,
        _gyroscopeStream = gyroscopeStream ?? gyroscopeEvents;

  void startSensors() {
    _accelerometerStream.listen((event) {
      accelerometer = [event.x, event.y, event.z];
      print("Accelerometer: $accelerometer");
    });

    _gyroscopeStream.listen((event) {
      gyroscope = [event.x, event.y, event.z];
      print("Gyroscope: $gyroscope");
    });
  }
}