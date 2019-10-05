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
  test('one_pool', () {
    debugPrint('check 7 on 5 -- one pool');
     List<int> list = [0,0,0,0,0,0,0];
    int errorCount = 0;

    final BaseDieRandomService _dieRandomService = DieRandomService();
    int idx;
    _dieRandomService.initPool();
    final List<int> _pool = _dieRandomService.getPool();
    _pool.sort();
    debugPrint('show pool ${_pool.toString()}');
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

  test('fresh_pools', () {

    debugPrint('check 7 on 5 -- refresh pool every rolls');
    List<int> list = [0,0,0,0,0,0,0];
    int errorCount = 0;

    final BaseDieRandomService _dieRandomService = DieRandomService();
    int idx;

    for (idx = 0; idx < 100; idx++) {
      _dieRandomService.initPool();
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

  test('fresh_pools_10', () {

    debugPrint('check 7 on 5 -- refresh pool(die) every 10 rolls');
    List<int> list = [0,0,0,0,0,0,0];
    int errorCount = 0;

    final BaseDieRandomService _dieRandomService = DieRandomService();
    int idx;
    _dieRandomService.initPool();
    List<int> _pool = _dieRandomService.getPool();
    _pool.sort();
    debugPrint('show pool ${_pool.toString()}');

    for (idx = 0; idx < 100; idx++) {
      if(idx%10==0 && idx >0){
        _dieRandomService.initPool();
        _pool = _dieRandomService.getPool();
        _pool.sort();
        debugPrint('new pool ${_pool.toString()}');

      }
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
