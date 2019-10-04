import 'package:flutter/material.dart';
import 'package:seven_die/src/data/global_data.dart';
import 'package:seven_die/src/ui/style.dart';

class FiveDie extends StatelessWidget {
  final int num;
  const FiveDie(this.num, {Key key}):super(key:key);
  Image _getPentagram(int num) {
    switch (num) {
      case 1:
        return Image.asset('assets/images/pentagram_blue.png');

      case 2:
        return Image.asset('assets/images/pentagram_green.png');
      case 3:
        return Image.asset('assets/images/pentagram_orange.png');
      case 4:
        return Image.asset('assets/images/pentagram_purple.png');
      case 5:
        return Image.asset('assets/images/pentagram_red.png');
      case 6:
        return Image.asset('assets/images/pentagram_violet.png');
      case 7:
        return Image.asset('assets/images/pentagram_yellow.png');
      default:
        return Image.asset('assets/images/pentagram_yellow.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //
      alignment: Alignment.center,
      children: <Widget>[
        _getPentagram(num),
        Text(num.toString(), style: dieTextStyle()),
      ],
    );
  }
}
