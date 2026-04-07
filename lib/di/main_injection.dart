

import 'package:activity/di/drilling_activity_injection.dart';
import 'package:activity/repository/drilling_activity_datasource.dart';
import 'package:activity/repository/drilling_activity_datasource_impl.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_bloc.dart';
import 'package:drilling_app/features/drilling/usecase/input_drilling_usecase.dart';
import 'package:drilling_app/features/drilling/usecase/input_drilling_usecase_impl.dart';
import 'package:sqflite/sqflite.dart';

Future<void> mainInjection() async{

drillingRepoInjection();
getIt.registerFactory<DrillingActivityDatasource>(()=>  DrillingActivityDatasourceImpl(getIt<Database>()) );

getIt.registerFactory<InputDrilling>(()=> InputDrillingImpl(datasource: getIt<DrillingActivityDatasource>()) );
getIt.registerFactory<DrillingBloc>(()=> DrillingBloc(drilling: getIt<InputDrilling>()));


}