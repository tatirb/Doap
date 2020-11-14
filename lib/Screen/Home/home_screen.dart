import 'package:flutter/material.dart';
import 'main_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: MainDrawer(),
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
    );
  }
}