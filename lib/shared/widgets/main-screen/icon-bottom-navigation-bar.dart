import 'package:flutter/material.dart';
import 'package:spotify_clone/shared/colors.dart';

class IconBottomNavigationBar extends StatefulWidget {
  final IconData icon;
  final String label;
  final String selected;

  const IconBottomNavigationBar({this.icon, this.label, this.selected});

  @override
  _IconBottomNavigationBarState createState() => _IconBottomNavigationBarState();
}

class _IconBottomNavigationBarState extends State<IconBottomNavigationBar> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (v) {
        setState(() {
          pressed = true;
        });
      },
      onTapUp: (v) {
        setState(() {
          pressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: widget.selected == widget.label && !pressed ? Colors.white : lightGrey,
              size: 30,
            ),
            Text(
              widget.label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: pressed ? lightGrey : Colors.white),
            )
          ],
        ),
        transform: (pressed
            ? (Matrix4.identity()
              ..translate(0.9, 0.9)
              ..scale(0.9, 0.9))
            : Matrix4.identity()),
      ),
    );
  }
}
