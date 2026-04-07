import 'package:activity/repository/drilling_history_datasource.dart';
import 'package:activity/repository/drilling_history_datasource_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqlite_api.dart';

final getIt = GetIt.instance;

void drillingRepository() {
  getIt.registerFactory<DrillingHistoryDatasource>(
    () => DrillingHistoryDatasourceImpl(getIt<Database>()),
  );
}
