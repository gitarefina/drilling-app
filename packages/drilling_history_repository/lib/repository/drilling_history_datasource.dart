import 'package:core/database/drilling_model.dart';

abstract class DrillingHistoryDatasource {
  Future<List<DrillingModel>> getHistoryDrilling();
  Future<List<DrillingModel>> getHistoryDrillingDraft();


}