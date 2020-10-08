import 'package:flutter/material.dart';

import '../colors.dart';
import 'main-screen/button-navigation-bar.dart';

class BottomNavigationBarDefault extends StatefulWidget {
  final resource;

  const BottomNavigationBarDefault({this.resource});

  @override
  _BottomNavigationBarDefaultState createState() => _BottomNavigationBarDefaultState();
}

class _BottomNavigationBarDefaultState extends State<BottomNavigationBarDefault> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonNavigationBar(
            icon: Icons.home,
            label: "Início",
            selected: widget.resource,
          ),
          ButtonNavigationBar(
            icon: Icons.search,
            label: "Buscar",
            selected: widget.resource,
          ),
          ButtonNavigationBar(
            icon: Icons.library_music,
            label: "Sua biblioteca",
            selected: widget.resource,
          )
        ],
      ),
      height: 60,
      alignment: Alignment.center,
      color: darkGrey,
    );
  }
}
