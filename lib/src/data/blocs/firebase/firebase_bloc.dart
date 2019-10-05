import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:seven_die/src/data/services/dieroller.dart';
import 'package:seven_die/src/data/services/firebase.dart';
import 'package:seven_die/src/data/global_data.dart';
import './bloc.dart';


class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  @override
  FirebaseState get initialState => FirebaseStateInit();

  // get services
  final BaseFirebaseService _firebaseService = FirebaseService();
  final BaseDieRandomService _dieRandomService = DieRandomService();

  @override
  Stream<FirebaseState> mapEventToState(
    FirebaseEvent event,
  ) async* {
    if(event is FirebaseEventInit){
      // set stream to load roll updates into
     // await _firebaseService.initRollListener(event.callback);
      final Stream stream = _firebaseService.getStream();
      debugPrint(':::::D7:::::: FirebaseEventInit');
      yield FirebaseStateInitResponse(stream);
    }

//    if(event is FirebaseEventCheckLock){
//      final bool locked = await _firebaseService.getLock();
//      yield FirebaseStateResponse(locked);
//    }

    if(event is FirebaseEventUnlock){
      await _firebaseService.setLock(false);
      yield FirebaseStateLoaded();
    }

    if(event is FirebaseEventRollDie){
      // begin new roll //
      // lock firebase
      await _firebaseService.setLock(true);

      // create new pool
      _dieRandomService.initPool();
      final List<int> _list = _dieRandomService.getPool();
      _list.sort();
      _firebaseService.setPool(_list);
      int idx;

      for (idx = 0; idx < SPINS; idx++ ){
        await Future.delayed(Duration(seconds: SECONDS ));
        final int rand = _dieRandomService.getRandom();
        _firebaseService.setRoll(rand);
      }

      // roll complete

      await _firebaseService.setLock(false);
      yield FirebaseStateLoaded();



      // time loop //

      // on final unlock
      
    }
  }
}


/*
FirebaseEventInit extends FirebaseEvent {}

class FirebaseEventUpdateRoll extends FirebaseEvent {
  final int roll;
  FirebaseEventUpdateRoll(this.roll);
  @override
  List<Object> get props => [roll];
}
class FirebaseEventUnlock extends FirebaseEvent {}
class FirebaseEventLock extends FirebaseEvent {}
 */