import 'package:flutter/material.dart';
import 'package:qapaq_b2b/home.dart';
import 'package:qapaq_b2b/login.dart';
import 'package:qapaq_b2b/signUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qapaq',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
        ),
        iconTheme: IconThemeData (
          color: Colors.white,
        ),
      ),

      home: Home(),
      routes: {
        '/signUp': (context) => SignUp(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/feedback': (context) => Home(),
      },
    );
  }
}