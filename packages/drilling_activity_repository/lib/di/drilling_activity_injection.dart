import 'package:activity/repository/drilling_activity_datasource.dart';
import 'package:activity/repository/drilling_activity_datasource_impl.dart';
import 'package:core/database/drilling_db.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqlite_api.dart';

final getIt = GetIt.instance;

Future<void> drillingRepoInjection() async {
  final db = await DrillingDb.instance.database;

  getIt.registerSingleton<Database>(db);
  getIt.registerLazySingleton<DrillingActivityDatasource>(
    () => DrillingActivityDatasourceImpl(getIt<Database>()),
  );
}
