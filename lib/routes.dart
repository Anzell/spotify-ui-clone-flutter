import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/login-screen.dart';
import 'package:spotify_clone/screens/main-screen.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case "/main-screen":
        return MaterialPageRoute(
            builder: (_) => MainScreen(
                  resource: args['resource'],
                ));
        break;
      default:
        return _error();
    }
  }

  static Route<dynamic> _error() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(body: Center(child: Text("Esta rota não é válida !")));
    });
  }
}
