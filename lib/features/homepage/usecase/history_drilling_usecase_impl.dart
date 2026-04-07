 import 'package:core/database/drilling_model.dart';
import 'package:drilling_app/features/homepage/usecase/history_drilling_usecase.dart';
import 'package:homepage/repository/drilling_history_datasource.dart';

class HistoryDrillingUsecaseImpl extends HistoryDrillingUsecase {
  final DrillingHistoryDatasource datasource;
  HistoryDrillingUsecaseImpl(this.datasource);
  @override
  Future<List<DrillingModel>> getHistoryDrilling() async {
    try {
      final repo = await datasource.getHistoryDrilling();
      return repo;
    } catch (e) {
      print(e);
      return [];
    }
   
  }
  
  @override
  Future<List<DrillingModel>> getHistoryDrillingDraft() async {
 try {
      final repo = await datasource.getHistoryDrillingDraft();
      return repo;
    } catch (e) {
      print(e);
      return [];
    }  }
}