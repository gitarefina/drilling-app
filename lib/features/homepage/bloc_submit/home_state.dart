
import 'package:core/database/drilling_model.dart';
import 'package:equatable/equatable.dart';


enum HomeStatus{initial, loading,success,error}
class HomeState  extends Equatable{
  final HomeStatus status;
  final List<DrillingModel>? model;
  final String? message;
  const HomeState({required this.status,  this.model, this.message});

  factory HomeState.initial() =>
      const HomeState(status: HomeStatus.initial);


  HomeState copyWith({HomeStatus? status,

    List<DrillingModel>? model,
    String? message,

  }) {
    return HomeState(
      status: status ?? this.status,
      model:model??this.model,
      message: message ?? this.message,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [status];
}