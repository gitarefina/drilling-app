import 'package:drilling_app/features/homepage/bloc_submit/home_event.dart';
import 'package:drilling_app/features/homepage/bloc_submit/home_state.dart';
import 'package:drilling_app/features/homepage/usecase/history_drilling_usecase.dart';
import 'package:drilling_app/features/homepage/usecase/history_drilling_usecase_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HistoryDrillingUsecase drillingUsecase;
  HomeBloc({required this.drillingUsecase}) : super(HomeState.initial()) {
    on<getHistorySubmit>((event, submit) async {
      try {
        state.copyWith(status: HomeStatus.loading);
        final result = await drillingUsecase.getHistoryDrilling();
        print(result);
        emit(state.copyWith(status: HomeStatus.success, model: result));
      } catch (e) {
        print(e);
        emit(state.copyWith(status: HomeStatus.error, message: e.toString()));
      }
    });
  
  }
}
