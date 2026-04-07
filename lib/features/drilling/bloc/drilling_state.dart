import 'package:equatable/equatable.dart';

enum DrillingStatus {initial, loading, success, error }

class DrillingState extends Equatable {
  final DrillingStatus status;
  final String? message;
  const DrillingState({required this.status,  this.message});

  factory DrillingState.initial() =>
      const DrillingState(status: DrillingStatus.initial);

      DrillingState copyWith({DrillingStatus? status, 
  
  String? message,
  String? location
  
  }) {
    return DrillingState(
      status: status ?? this.status,
      message:message??this.message,
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props =>[status];
}
