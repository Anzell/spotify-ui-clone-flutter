import 'package:flutter/material.dart';
import 'package:spotify_clone/shared/colors.dart';

class LoginOptionButton extends StatefulWidget {
  final Color backgroundColor;
  final String label;
  final Icon prefixIcon;
  final bool border;
  final Color secondaryColor;

  const LoginOptionButton(
      {this.backgroundColor, this.label, this.prefixIcon, this.border = false, this.secondaryColor});

  @override
  _LoginOptionButtonState createState() => _LoginOptionButtonState();
}

class _LoginOptionButtonState extends State<LoginOptionButton> with TickerProviderStateMixin {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (v) {
        setState(() {
          pressed = true;
        });
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/main-screen", (route) => false, arguments: {"resource": "Início"});
      },
      onTapUp: (v) {
        setState(() {
          pressed = false;
        });
      },
      child: AnimatedContainer(
        width: !pressed ? MediaQuery.of(context).size.width / 1.3 : MediaQuery.of(context).size.width / 1.4,
        duration: Duration(milliseconds: 60),
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: widget.border ? lightGrey : Colors.transparent),
            color: !pressed ? widget.backgroundColor : widget.secondaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: Text(widget.label),
      ),
    );
  }
}
