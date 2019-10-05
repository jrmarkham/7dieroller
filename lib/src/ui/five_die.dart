import 'package:flutter/material.dart';
import 'package:seven_die/src/data/global_data.dart';
import 'package:seven_die/src/ui/style.dart';

class FiveDie extends StatelessWidget {
  final int num;
  final bool small;
  const FiveDie(this.num, {this.small =false, Key key}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      //
      alignment: Alignment.center,
      children: <Widget>[
        getPentagram(num),
        Text(num.toString(), style: small ?dieMiniTextStyle() : dieTextStyle()),
      ],
    );
  }
}
