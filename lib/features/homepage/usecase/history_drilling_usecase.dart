import 'package:core/database/drilling_model.dart';

abstract class HistoryDrillingUsecase {
  Future<List<DrillingModel>> getHistoryDrilling();
}