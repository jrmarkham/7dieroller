import 'dart:math' show Random;
import 'package:seven_die/src/data/global_data.dart';


abstract class BaseDieRandomService {
    int getRandom();
}

class DieRandomService extends BaseDieRandomService {
    static final BaseDieRandomService _instance = DieRandomService.internal();
    factory DieRandomService() => _instance;
    DieRandomService.internal();
    final Random _randomize = Random();

    int getRandom(){
        return _randomize.nextInt(DIE_MAX) + DIE_MIN;
    }
    

}