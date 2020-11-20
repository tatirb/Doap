import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DocumentSnapshot>(context);
    String username = user.get('username');
    String name = user.get('name');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
                      Container(
            width: double.infinity,
            padding: EdgeInsets.all(17),
            color: Colors.grey[100],
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Text(
                        name, 
                        style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        ),
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                    child: Text(
                      username,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
