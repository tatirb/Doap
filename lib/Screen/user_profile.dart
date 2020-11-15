import 'package:flutter/material.dart';
import 'package:doap/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:doap/Screen/user_list.dart';
import 'package:doap/Models/profile.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Profile>.value(
      value: DatabaseService().user,
      child: Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ), // AppBar
      body: UserList(),
      ), // Scaffold
    ); // StreamProvider.value
  }
}
