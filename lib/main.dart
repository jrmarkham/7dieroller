import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seven_die/src/app.dart';
import 'package:seven_die/src/data/global_data.dart';
void main() {

  // I like to load a global data function
  // to init style / content text and any non secure data across the app
  // this is useful for assuring that consts and style are consistent

  GlobalData.initGlobalData().then((_) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(
          MaterialApp(
              debugShowCheckedModeBanner: false,
              title: title,
              theme: appTheme(),
              home: App()));
    });
  });
}
