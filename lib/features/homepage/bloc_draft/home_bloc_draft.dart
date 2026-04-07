import 'package:drilling_app/features/homepage/bloc_draft/home_event_draft.dart';
import 'package:drilling_app/features/homepage/bloc_draft/home_state_draft.dart';
import 'package:drilling_app/features/homepage/usecase/history_drilling_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocDraft extends Bloc<HomeDraftEvent, HomeStateDraft> {
  final HistoryDrillingUsecase drillingUsecase;
  HomeBlocDraft({required this.drillingUsecase}) : super(HomeStateDraft.initial()) {
    on<getHistoryDraft>((event, submit) async {
      try {
        state.copyWith(status: HomeStatusDraft.loading);
        final result = await drillingUsecase.getHistoryDrillingDraft();
        print(result);
        emit(state.copyWith(status: HomeStatusDraft.success, model: result));
      } catch (e) {
        print(e);
        emit(state.copyWith(status: HomeStatusDraft.error, message: e.toString()));
      }
    });
   
  }
}
