import 'package:equatable/equatable.dart';

abstract class FirebaseState extends Equatable {
  const FirebaseState([List props = const <dynamic>[]]);
  @override
  List<Object> get props => [props];
}

class FirebaseStateInit extends FirebaseState {}
class FirebaseStateLoading extends FirebaseState {}
class FirebaseStateInitResponse extends FirebaseState {
  final Stream stream;
  FirebaseStateInitResponse(this.stream);

  @override
  List<Object> get props => [stream];
}
class FirebaseStateLoaded extends FirebaseState {

}