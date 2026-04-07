

import 'package:activity/repository/drilling_history_datasource.dart';
import 'package:core/database/drilling_db.dart';
import 'package:core/database/drilling_model.dart';
import 'package:sqflite/sqlite_api.dart';

class DrillingHistoryDatasourceImpl  implements DrillingHistoryDatasource{
  final Database db;

  DrillingHistoryDatasourceImpl(this.db);
  
  @override
  Future<List<DrillingModel>> getHistoryDrilling() async{

    const orderby = '${DrillingFields.createdTime} DESC';
    final result = await db.query(DrillingFields.tableName,orderBy: orderby);// TODO: implement getHistoryDrilling
    return result.map((e)=>  DrillingModel.fromMap(e)).toList();
  
  }

}