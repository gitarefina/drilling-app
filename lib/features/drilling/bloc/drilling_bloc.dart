import 'package:drilling_app/features/drilling/bloc/drilling_event.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_state.dart';
import 'package:drilling_app/features/drilling/usecase/input_drilling_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrillingBloc extends Bloc<DrillingEvent, DrillingState> {
  final InputDrilling drilling;
  DrillingBloc({required this.drilling}) : super(DrillingState.initial()) {
    on<InsertDrilling>((event, emit) async {
      try {
        final repo = await drilling.inputDrilling(event.model);
         print(repo);
        emit(
          state.copyWith(
            status: DrillingStatus.success,
            message: "berhasil" + repo.toString(),
          ),
        );
      } catch (e) {
        print(e);
        state.copyWith(status: DrillingStatus.error,message: e.toString());
      }
    });
  }
}
