import 'package:flutter/cupertino.dart';

// DIE PARAMS 
const int DIE_MIN = 1;
const int DIE_MAX = 7;
const int DIE_POOL = 5;


abstract class BaseDieRandomService {
    int getRandom();
    initPool();
    List<int>getPool();

}

class DieRandomService extends BaseDieRandomService {
    static final BaseDieRandomService _instance = DieRandomService.internal();
    factory DieRandomService() => _instance;
    DieRandomService.internal();
    final List<int> _pool = [];

    int getRandom(){
        if(_pool.isEmpty)_createPool();
        // randomize and return top element
        _pool.shuffle();
        return _pool[0];
    }

    initPool(){
        _pool.clear();
        _createPool();
    }

    List<int> getPool()=> _pool.toList();


    _createPool(){
        _fillPool();
        _pool.shuffle(); // randmize and remove
        while(_pool.length > DIE_POOL){
            _pool.removeLast();
        }
    }

    _fillPool(){
        int idx;
        for(idx =0;idx<DIE_MAX;idx++)_pool.add(DIE_MIN + idx);
    }
}
