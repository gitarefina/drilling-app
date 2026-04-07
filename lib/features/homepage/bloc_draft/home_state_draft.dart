
import 'package:core/database/drilling_model.dart';
import 'package:equatable/equatable.dart';


enum HomeStatusDraft{initial, loading,success,error}
class HomeStateDraft  extends Equatable{
  final HomeStatusDraft status;
  final List<DrillingModel>? model;
  final String? message;
  const HomeStateDraft({required this.status,  this.model, this.message});

  factory HomeStateDraft.initial() =>
      const HomeStateDraft(status: HomeStatusDraft.initial);


  HomeStateDraft copyWith({HomeStatusDraft? status,

    List<DrillingModel>? model,
    String? message,

  }) {
    return HomeStateDraft(
      status: status ?? this.status,
      model:model??this.model,
      message: message ?? this.message,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [status];
}