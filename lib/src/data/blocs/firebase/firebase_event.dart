import 'package:equatable/equatable.dart';

abstract class FirebaseEvent extends Equatable {
  FirebaseEvent([List props = const []]):super(props);
}

class FirebaseEventInit extends FirebaseEvent {}
class FirebaseEventRollDie extends FirebaseEvent {}