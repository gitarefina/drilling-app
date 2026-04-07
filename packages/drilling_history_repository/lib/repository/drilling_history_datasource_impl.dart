

import 'package:core/database/drilling_model.dart';
import 'package:sqflite/sqlite_api.dart';
import "package:homepage/repository/drilling_history_datasource.dart";

class DrillingHistoryDatasourceImpl  extends DrillingHistoryDatasource{
  final Database db;

  DrillingHistoryDatasourceImpl(this.db);
  
  @override
  Future<List<DrillingModel>> getHistoryDrilling() async{

    const orderby = '${DrillingFields.createdTime} DESC';
    final result = await db.query(DrillingFields.tableName,orderBy: orderby,where: '${DrillingFields.statusWorkflow} = ?', whereArgs: [WorkflowStatus.submitted.value]);// TODO: implement getHistoryDrilling
    print(result);  
    print("get history drilling");
    
    return result.map((e)=>  DrillingModel.fromMap(e)).toList();
  
  }
  
  @override
  Future<List<DrillingModel>> getHistoryDrillingDraft() async{
    // TODO: implement getHistoryDrillingDraft

    const orderby = '${DrillingFields.createdTime} DESC';
    final result = await db.query(DrillingFields.tableName,orderBy: orderby,where: '${DrillingFields.statusWorkflow} = ?', whereArgs: [WorkflowStatus.draft.value]);// TODO: implement getHistoryDrilling
    print(result);  
    print("get history drilling");
    
    return result.map((e)=>  DrillingModel.fromMap(e)).toList();  }

}

