import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qapaq_b2b/layout/product.dart';
import 'package:qapaq_b2b/pages/home.dart';
import 'package:qapaq_b2b/pages/login.dart';
import 'package:qapaq_b2b/services/category.dart';
import 'package:qapaq_b2b/pages/signUp.dart';
import 'package:qapaq_b2b/services/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
      ],
      child: MaterialApp(
        title: 'Qapaq',
        theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        home: Home(),
        routes: {
          '/signUp': (context) => SignUp(),
          '/login': (context) => Login(),
          '/home': (context) => Home()
        },
      ),
    );
  }
}
