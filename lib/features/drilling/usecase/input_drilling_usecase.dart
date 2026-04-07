import 'package:core/database/drilling_model.dart';

abstract class InputDrilling {
  Future<Map<String,dynamic>> inputDrilling(DrillingModel model);
}