import 'package:equatable/equatable.dart';

abstract class FirebaseState extends Equatable {
  const FirebaseState();
}

class FirebaseStateInit extends FirebaseState {
  @override
  List<Object> get props => [];
}
class FirebaseStateLoading extends FirebaseState {
  @override
  List<Object> get props => [];
}
class FirebaseStateInitResponse extends FirebaseState {
  final Stream stream;
  FirebaseStateInitResponse(this.stream);

  @override
  List<Object> get props => [stream];
}

class FirebaseStateLoaded extends FirebaseState {
  @override
  List<Object> get props => [];

}