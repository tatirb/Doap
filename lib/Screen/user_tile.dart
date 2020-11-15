import 'package:flutter/material.dart';
import 'package:doap/Models/profile.dart';

class UserTile extends StatelessWidget {

  final Profile user;
  UserTile({this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.orange,
          ),
          title: Text(user.name),
          subtitle: Text(user.username),
        ),
      ),
    );
  }
}
