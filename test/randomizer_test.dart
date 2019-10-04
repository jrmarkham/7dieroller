// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seven_die/src/data/services/dieroller.dart';

void main() {
  test('Randomizer for default 1-7 ', () {
     List<int> list = [0,0,0,0,0,0,0];
    int errorCount = 0;

    final BaseDieRandomService _dieRandomService = DieRandomService();
    int idx;
    for (idx = 0; idx < 100; idx++) {
      final rand = _dieRandomService.getRandom();
      if(rand<8 && rand > 0) {
        // increment the list
        list[rand - 1] = list[rand - 1] + 1;

      }else {
        errorCount++;
      }
    }
// display -- counts for various result to ensure randomness
    debugPrint('ones = ${list[0].toString()}');
    debugPrint('twos = ${list[1].toString()}');
    debugPrint('threes = ${list[2].toString()}');
    debugPrint('fours = ${list[3].toString()}');
    debugPrint('fives = ${list[4].toString()}');
    debugPrint('sixes = ${list[5].toString()}');
    debugPrint('sevens = ${list[6].toString()}');
    debugPrint('error (out of range) = ${errorCount.toString()}');
    expect(errorCount, 0);
  });
}
