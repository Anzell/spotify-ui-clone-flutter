import 'package:flutter/material.dart';
import 'package:spotify_clone/routes.dart';
import 'screens/login-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: RoutesGenerator.generateRoute,
      theme: ThemeData(
          textTheme: TextTheme(body1: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
      home: LoginScreen(),
    );
  }
}
