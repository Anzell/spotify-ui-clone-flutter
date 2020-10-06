import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/search-screen.dart';
import 'package:spotify_clone/screens/user-library-screen.dart';
import 'package:spotify_clone/screens/welcome-screen.dart';
import 'package:spotify_clone/shared/colors.dart';
import 'package:spotify_clone/shared/widgets/main-screen/button-navigation-bar.dart';

class MainScreen extends StatelessWidget {
  final resource;

  const MainScreen({this.resource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen(),
      bottomNavigationBar: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonNavigationBar(
              icon: Icons.home,
              label: "Início",
              selected: resource,
            ),
            ButtonNavigationBar(
              icon: Icons.search,
              label: "Buscar",
              selected: resource,
            ),
            ButtonNavigationBar(
              icon: Icons.library_music,
              label: "Sua biblioteca",
              selected: resource,
            )
          ],
        ),
        height: 60,
        alignment: Alignment.center,
        color: darkGrey,
      ),
    );
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
