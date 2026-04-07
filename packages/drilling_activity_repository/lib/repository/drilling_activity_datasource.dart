import 'package:core/database/drilling_model.dart';

abstract class DrillingActivityDatasource{
  
  Future<int> insertDrilling(DrillingModel model);
}