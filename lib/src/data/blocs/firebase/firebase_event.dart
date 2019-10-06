import 'package:equatable/equatable.dart';

abstract class FirebaseEvent extends Equatable {
  const FirebaseEvent();
}

class FirebaseEventInit extends FirebaseEvent {
  @override
  List<Object> get props => [];
}
class FirebaseEventRollDie extends FirebaseEvent {
  @override
  List<Object> get props => [];
}