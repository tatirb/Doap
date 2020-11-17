import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('user');

  Future updateUserData(String username, String name) async {
    return await userCollection.doc(uid).set({
      'username': username,
      'name' : name,
    });
  }    

  String id() {
    print(uid);
    return uid;
  }

  Future getUserData(String uid) async {
    return await userCollection.doc(uid).get();
  }  

  String currentUser() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var user = _auth.currentUser;
    return user.uid;
  }

  Stream<DocumentSnapshot> get user {
    return userCollection.doc(currentUser()).snapshots();
  }

}