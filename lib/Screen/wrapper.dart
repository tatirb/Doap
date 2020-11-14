import 'package:doap/Screen/Authenticate/authenticate.dart';
import 'package:doap/Screen/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doap/Models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context); 
    //retorna home ou authenticate 
    if (user == null) {
      return Authenticate();
    }
    else {
      return HomeScreen();
    }
  }
}