import 'package:sensors_plus/sensors_plus.dart';

class SensorsService {
  void startSensors() {
    Future<double> accelerometerX() async {
      var accelerometer_x = 0.0;
      accelerometerEventStream().listen((AccelerometerEvent event) {
        accelerometer_x = event.x;
      });
      return accelerometer_x;
    }

     Future<double> accelerometerY() async {
      var accelerometer_y = 0.0;
      accelerometerEventStream().listen((AccelerometerEvent event) {
        accelerometer_y= event.x;
      });
      return accelerometer_y;
    }
     Future<double> accelerometerZ() async {
      var accelerometer_z = 0.0;
      accelerometerEventStream().listen((AccelerometerEvent event) {
        accelerometer_z = event.z;
      });
      return accelerometer_z;
    }

   
  }
}
