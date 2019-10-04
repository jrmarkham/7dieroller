import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_die/src/data/blocs/firebase/bloc.dart';
import 'package:seven_die/src/data/global_data.dart';
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

  // called once from the bloc listener to assugn the stream to the stream builder
  // which handles the flow of data (roll updates and the locks/unlock)

  void setStreamStream(Stream _ds) {
    setState(() {
      _dataStream = _ds;
    });
  }


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
                    // in more complex app we would have more to listen too
                  if (state is FirebaseStateInitResponse) {
                    // set stream //
                    setStreamStream(state.stream);
                  }
                },

                // this updates in real time w/ the could data to run the display
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

                      final Function buttonFunction = _locked
                          ? null
                          : () =>
                              _firebaseBloc.dispatch(FirebaseEventRollDie());
                      final String buttonText = _locked ? btnLocked : btnRoll;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
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
