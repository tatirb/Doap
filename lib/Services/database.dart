import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doap/Models/profile.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  //final CollectionReference userCollection = FirebaseFirestore.instance.collection('user').doc(uid);

  final DocumentReference userCollection = FirebaseFirestore.instance.collection('user').doc('CPzI62vHabbnOyV73Ow83dZjBGh2');

  Future updateUserData(String username, String name) async {
    return await userCollection.set({
      'username': username,
      'name' : name,
    });
  }
  // user list from snapshot
  Profile _userListFromSnapshot(DocumentSnapshot snapshot) {
    //return snapshot.docs.map((doc) {
      return Profile(
        name: snapshot.data()['name'] ?? '',
        username: snapshot.data()['username'] ?? '',
      );
    //}).toList();
  }

  //get user stream
  Stream<Profile> get user {
    return userCollection.snapshots()
      .map(_userListFromSnapshot);
  }

  

}