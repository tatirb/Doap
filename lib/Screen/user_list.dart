import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doap/Models/profile.dart';
import 'package:doap/Screen/user_tile.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Profile>(context);
    
    //user.forEach((profile) { 
      //print(profile.name);
      //print(profile.username);
    //});

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return UserTile(user: user);
      },
    );
  }
}