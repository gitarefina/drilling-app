import 'package:activity/repository/drilling_activity_datasource.dart';
import 'package:activity/repository/drilling_activity_datasource_impl.dart';
import 'package:core/database/drilling_db.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_bloc.dart';
import 'package:drilling_app/features/drilling/usecase/input_drilling_usecase.dart';
import 'package:drilling_app/features/drilling/usecase/input_drilling_usecase_impl.dart';
import 'package:drilling_app/features/homepage/bloc_draft/home_bloc_draft.dart';
import 'package:drilling_app/features/homepage/bloc_submit/home_bloc.dart';
import 'package:drilling_app/features/homepage/usecase/history_drilling_usecase.dart';
import 'package:drilling_app/features/homepage/usecase/history_drilling_usecase_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:homepage/repository/drilling_history_datasource.dart';
import 'package:homepage/repository/drilling_history_datasource_impl.dart';
import 'package:sqflite/sqlite_api.dart';

final getIt = GetIt.instance;

Future<void> mainInjection() async {
  final db = await DrillingDb.instance.database;
  getIt.registerSingleton<Database>(db);
  getIt.registerLazySingleton<DrillingActivityDatasource>(
    () => DrillingActivityDatasourceImpl(getIt<Database>()),
  );
  getIt.registerFactory<InputDrilling>(
    () => InputDrillingImpl(datasource: getIt<DrillingActivityDatasource>()),
  );
  
  getIt.registerFactory<DrillingBloc>(
    () => DrillingBloc(drilling: getIt<InputDrilling>()),
  );
 getIt.registerLazySingleton<DrillingHistoryDatasource>(
    () => DrillingHistoryDatasourceImpl(getIt<Database>()),
  ); 
  getIt.registerFactory<HistoryDrillingUsecase>(()=> HistoryDrillingUsecaseImpl(getIt<DrillingHistoryDatasource>()));
    getIt.registerFactory<HomeBloc>(
    () => HomeBloc(drillingUsecase: getIt<HistoryDrillingUsecase>()),
  );
    getIt.registerFactory<HomeBlocDraft>(
    () => HomeBlocDraft(drillingUsecase: getIt<HistoryDrillingUsecase>()),
  );
  
  
}
