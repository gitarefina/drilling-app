
import 'package:activity/repository/drilling_activity_datasource.dart';
import 'package:core/database/drilling_model.dart';
import 'package:sqflite/sqlite_api.dart';

class DrillingActivityDatasourceImpl extends DrillingActivityDatasource {
  final Database database;
  DrillingActivityDatasourceImpl(this.database);
  @override
  Future<int> insertDrilling(DrillingModel model) async {
   final response = await database.insert('drilling', model.toMap());
   return response;
  }
}