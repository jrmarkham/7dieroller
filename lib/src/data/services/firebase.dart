
// Firebase Roast Firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seven_die/src/data/global_data.dart';

const String SEVEN_DIE_COLLECTION = 'dieroller';
const String SEVEN_DIE_DOCUMENT = 'main';

abstract class BaseFirebaseService {
    Stream getStream();
    Future<void> setLock(bool _lock);
    Future<void> setRoll(int _roll);
}

class FirebaseService extends BaseFirebaseService {
    static final FirebaseService _instance = FirebaseService.internal();
    factory FirebaseService() => _instance;
    FirebaseService.internal();
    final Firestore _firestore = Firestore.instance;
    bool locked;

// FOR DATABASE LISTENER
    CollectionReference _getCollectionReference () => _firestore.collection(SEVEN_DIE_COLLECTION);

    getStream() => _getCollectionReference().snapshots();

// SET LOCK
  Future<void> setLock(bool _lock) async {
     await _firestore.collection(SEVEN_DIE_COLLECTION).document(SEVEN_DIE_DOCUMENT).updateData({LOCKED:_lock});
     return;
  }
// SET ROLL
    Future<void> setRoll(int _roll) async {
        await _firestore.collection(SEVEN_DIE_COLLECTION).document(SEVEN_DIE_DOCUMENT).updateData({ROLL:_roll});
        return;
    }

}