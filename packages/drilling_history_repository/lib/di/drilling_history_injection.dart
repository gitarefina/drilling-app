import 'package:get_it/get_it.dart';
import 'package:homepage/repository/drilling_history_datasource.dart';
import 'package:homepage/repository/drilling_history_datasource_impl.dart';
import 'package:sqflite/sqlite_api.dart';


final getIt = GetIt.instance;
Future<void> historyInjection() async{

  getIt.registerLazySingleton<DrillingHistoryDatasource>(
    () => DrillingHistoryDatasourceImpl(getIt<Database>()),
  ); 
}