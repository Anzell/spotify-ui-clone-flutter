import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/search-screen.dart';
import 'package:spotify_clone/screens/user-library-screen.dart';
import 'package:spotify_clone/screens/welcome-screen.dart';
import 'package:spotify_clone/shared/colors.dart';
import 'package:spotify_clone/shared/widgets/main-screen/icon-bottom-navigation-bar.dart';

class MainScreen extends StatelessWidget {
  final resource;

  const MainScreen({this.resource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: resource == "Início"
          ? WelcomeScreen()
          : resource == "Buscar"
              ? SearchScreen()
              : resource == "Sua Biblioteca"
                  ? UserLibraryScreen()
                  : Container(),
      bottomNavigationBar: Container(
        height: 60,
        alignment: Alignment.center,
        color: darkGrey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconBottomNavigationBar(
              icon: Icons.home,
              label: "Início",
              selected: resource,
            ),
            IconBottomNavigationBar(
              icon: Icons.search,
              label: "Buscar",
              selected: resource,
            ),
            IconBottomNavigationBar(
              icon: Icons.library_music,
              label: "Sua biblioteca",
              selected: resource,
            )
          ],
        ),
      ),
    );
  }
}
