import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('user');

  Future updateUserData(String username, String name) async {
    return await userCollection.doc(uid).set({
      'username': username,
      'name' : name,
    });
  }
  //get user stream
  Stream<QuerySnapshot> get  user {
    return userCollection.snapshots();
  }

}