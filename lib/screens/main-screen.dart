import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/search-screen.dart';
import 'package:spotify_clone/screens/user-library-screen.dart';
import 'package:spotify_clone/screens/welcome-screen.dart';
import 'package:spotify_clone/shared/widgets/bottom-navigation-bar.dart';

class MainScreen extends StatelessWidget {
  final resource;

  const MainScreen({this.resource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _getScreen(),
        bottomNavigationBar: BottomNavigationBarDefault(
          resource: resource,
        ));
  }

  Widget _getScreen() {
    if (resource == "Início") {
      return WelcomeScreen();
    }
    if (resource == "Buscar") {
      return SearchScreen();
    }
    if (resource == "Sua Biblioteca") {
      return UserLibraryScreen();
    }
    return Container();
  }
}
