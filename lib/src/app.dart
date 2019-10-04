import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_die/src/data/global_data.dart';
import 'package:seven_die/src/ui/main_display.dart';

import 'data/blocs/firebase/bloc.dart';


class App extends StatefulWidget {
    @override
    _AppState createState() => _AppState();
}

// set style this init the size vars so text
// and widgets are sized based on the size of the device
initDevice(BuildContext context) {
    setDeviceDimensions(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
}


class _AppState extends State<App> {

    @override
    Widget build(BuildContext context) {
        initDevice(context);
        // often there are multiple providers
        // I built this app w/ the notion it could be easily expanded
        return MultiBlocProvider(
            providers: [
                BlocProvider<FirebaseBloc>(builder: (BuildContext context) => FirebaseBloc()),

            ],
            child: Scaffold(
                appBar: AppBar(
                    centerTitle: true,
                    title: Text(title, style: titleTextStyle()),
                    ),
                body:  MainDisplay()));
    }
}
