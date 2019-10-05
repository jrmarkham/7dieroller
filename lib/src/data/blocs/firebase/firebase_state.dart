import 'package:equatable/equatable.dart';

abstract class FirebaseState extends Equatable {
  FirebaseState([List props = const []]):super(props);
}

class FirebaseStateInit extends FirebaseState {}
class FirebaseStateLoading extends FirebaseState {}
class FirebaseStateInitResponse extends FirebaseState {
  final Stream stream;
  FirebaseStateInitResponse(this.stream):super([stream]);
}
class FirebaseStateLoaded extends FirebaseState {

}