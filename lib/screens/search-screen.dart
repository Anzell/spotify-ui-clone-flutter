import 'package:flutter/material.dart';
import 'package:spotify_clone/shared/colors.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(58, 58, 58, 1), black],
              stops: [0.01, 0.3])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: _screenWidth,
            child: Column(
              children: [
                Container(
                  height: _screenWidth / 3,
                ),
                Text("Buscar",
                    style: TextStyle(
                      fontSize: 40,
                    )),
                Container(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/search-screen");
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                    width: _screenWidth,
                    height: 50,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        Container(
                          width: 10,
                        ),
                        Text(
                          "Artistas, músicas ou podcasts",
                          style: TextStyle(color: darkGrey),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  width: _screenWidth,
                  child: Text("Seus genêros favoritos"),
                ),
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color.fromRGBO(0, 228, 150, 1), Color.fromRGBO(131, 218, 197, 1)])),
                      width: _screenWidth / 2.3,
                      height: 100,
                      child: Text("Dance/Eletronic"),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(188, 6, 6, 1),
                      ),
                      width: _screenWidth / 2.3,
                      height: 100,
                      child: Text("Rock"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
