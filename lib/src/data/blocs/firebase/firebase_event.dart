import 'package:equatable/equatable.dart';

abstract class FirebaseEvent extends Equatable {
  const FirebaseEvent([List props = const <dynamic>[]]);

  @override
  List<Object> get props => [props];
}

class FirebaseEventInit extends FirebaseEvent {}

class FirebaseEventRollDie extends FirebaseEvent {}
class FirebaseEventUnlock extends FirebaseEvent {}
class FirebaseEventCheckLock extends FirebaseEvent {}