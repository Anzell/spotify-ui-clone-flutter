import 'package:flutter/material.dart';
import 'package:spotify_clone/shared/colors.dart';
import 'package:spotify_clone/shared/widgets/login/login-option-button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [darkGrey, black])),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: larguraTela,
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                  width: 80,
                  height: 80,
                ),
              ),
              Container(
                height: larguraTela,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Milhões de músicas à sua escolha"), Text("Grátis no SpotiClone")],
                ),
              ),
              Container(
                height: larguraTela,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LoginOptionButton(
                      backgroundColor: green,
                      label: "Inscreva-se grátis",
                      secondaryColor: green.withGreen(200).withBlue(10),
                    ),
                    Container(
                      height: 10,
                    ),
                    LoginOptionButton(
                      backgroundColor: Colors.black,
                      label: "Continuar com o Facebook",
                      border: true,
                      secondaryColor: lightGrey,
                    ),
                    Container(
                      height: 10,
                    ),
                    LoginOptionButton(backgroundColor: Colors.black, label: "Entrar")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
