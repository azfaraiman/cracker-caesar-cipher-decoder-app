import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference crackerCollection =
      Firestore.instance.collection('cracker');

  Future updateUserData(String encrypted, String decrypted) async {
    return await crackerCollection.document(uid).setData({
      'encrypted': encrypted,
      'decrypted': decrypted,
    });
  }

  Stream<QuerySnapshot> get crackers {
    return crackerCollection.snapshots();
  }
}
