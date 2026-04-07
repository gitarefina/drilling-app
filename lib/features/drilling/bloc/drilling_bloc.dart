import 'package:drilling_app/features/drilling/bloc/drilling_event.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_state.dart';
import 'package:drilling_app/features/drilling/usecase/input_drilling_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrillingBloc extends Bloc<DrillingEvent, DrillingState> {
  final InputDrilling drilling;
  DrillingBloc({required this.drilling}) : super(DrillingState.initial()) {
    on<insertDrilling>((event, emit) async {
      final repo = await drilling.inputDrilling(event.model);
      
      emit(state.copyWith(status: DrillingStatus.success, message: "berhasil"+repo.toString()));
    
    });
  }
}
