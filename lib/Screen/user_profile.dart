import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:doap/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:doap/Screen/user_list.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<DocumentSnapshot>.value(
      value: DatabaseService().user,
      child: Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: UserList(),
      ),
    );
  }
}

