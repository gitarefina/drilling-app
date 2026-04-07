import 'package:activity/repository/drilling_activity_datasource.dart';
import 'package:core/database/drilling_model.dart';
import 'package:drilling_app/features/drilling/usecase/input_drilling_usecase.dart';

class InputDrillingImpl implements InputDrilling {
  final DrillingActivityDatasource datasource;

  InputDrillingImpl({required this.datasource});
  @override
  Future<Map<String, dynamic>> inputDrilling(DrillingModel model) async {
    final response = await datasource.insertDrilling(model);
    return {"result": response};
  }
}
