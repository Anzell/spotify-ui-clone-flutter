import 'package:flutter/material.dart';
import 'package:spotify_clone/shared/colors.dart';

class ButtonNavigationBar extends StatefulWidget {
  final IconData icon;
  final String label;
  final String selected;

  const ButtonNavigationBar({this.icon, this.label, this.selected});

  @override
  _ButtonNavigationBarState createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
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
        if (widget.label != widget.selected) {
          Navigator.pushNamed(context, "/main-screen", arguments: {"resource": widget.label});
        }
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
              ..translate(0.95, 0.95)
              ..scale(0.95, 0.95))
            : Matrix4.identity()),
      ),
    );
  }
}
