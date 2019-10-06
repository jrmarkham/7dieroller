import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_die/src/data/blocs/firebase/bloc.dart';
import 'package:seven_die/src/data/global_data.dart';
import 'package:seven_die/src/ui/display_pool.dart';
import 'package:seven_die/src/ui/five_die.dart';

class MainDisplay extends StatefulWidget {
  @override
  _MainDisplayState createState() => _MainDisplayState();
}

class _MainDisplayState extends State<MainDisplay> {
// FIREBASE BLOC CONTROLS  THE DATA ON FIREBASE
// user updates the bloc with events and the states are
// handled but the data stream
  FirebaseBloc _firebaseBloc;
  Stream _dataStream;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseBloc = BlocProvider.of<FirebaseBloc>(context);
    _firebaseBloc.dispatch(FirebaseEventInit());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: EdgeInsets.all(corePadding),
            child: BlocListener(
                bloc: _firebaseBloc,
                listener: (BuildContext context, FirebaseState state) {
                    // in a more complex app we would have more to listen to
                  if (state is FirebaseStateInitResponse) {
                    // set stream //

                      // called once from the bloc listener to assigns the stream to the stream builder
                      // which handles the flow of data (roll updates and the locks/unlock)
                    setState(() {
                        _dataStream = state.stream;
                    });
                  }
                },

                // the Stream builder updates in real time w/ the could data to run the display
                // on the animated die and locks and unlocks the button
                child: StreamBuilder<dynamic>(
                    stream: _dataStream,
                    builder: (context, snapshot)  {
                      if (!snapshot.hasData) {
                        return appLoading();
                      }

                      final bool _locked =
                          snapshot.data.documents.first.data[LOCKED];
                      final int _roll =
                          snapshot.data.documents.first.data[ROLL];
                      final List<dynamic> _pool =
                      snapshot.data.documents.first.data[POOL];

                      debugPrint(':::::D7::::: locked $_locked');


                      final Function buttonFunction = _locked ? null : ()=> _firebaseBloc.dispatch(FirebaseEventRollDie());
                      //final Function buttonFunction = _locked ? null : ()=> rollDie();

                      final String buttonText = _locked ? btnLocked : btnRoll;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                            DisplayPool(_pool),
                          AnimatedSwitcher(
                            duration: Duration(seconds: SECONDS),
                            switchInCurve: Curves.easeIn,
                            switchOutCurve: Curves.easeOut,
                            transitionBuilder:
                                (Widget child, Animation<double> animation) =>
                                    RotationTransition(
                              child: child,
                              turns: animation,

                            ),
                            child: FiveDie(
                              _roll,
                              key: ValueKey<int>(_roll),
                            ),
                          ),
                          appButton(buttonText, buttonFunction, ButtonSizes.med)
                        ],
                      );
                    }))));
  }
}
