import 'package:doap/Screen/wrapper.dart';
import 'package:doap/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:doap/Models/user.dart';
//import 'Screen/Home/home_screen.dart';
import 'Screen/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //Color selection = Colors.deepOrange[300];
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value (
      value: AuthService().user,
      child: MaterialApp(
      title: 'Doap',
      theme: ThemeData(
        primaryColor: Colors.deepOrange[400],
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/user-profile': (_) => UserProfile(),
      },
    ),
    );
  }
}

