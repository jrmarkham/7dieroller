import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:seven_die/src/ui/five_die.dart';

class DisplayPool extends StatelessWidget {
  final List<dynamic> pool;

  DisplayPool(this.pool);

  Widget getDieFace(int num) {
    return Container(
        width: 50.0, height: 50.0, child: FiveDie(num, small: true));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[for (int item in pool) getDieFace(item)],
    );
  }
}
