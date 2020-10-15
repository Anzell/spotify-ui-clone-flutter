import 'package:flutter/material.dart';
import 'package:spotify_clone/shared/colors.dart';

class SearchMusicScreen extends StatefulWidget {
  @override
  _SearchMusicScreenState createState() => _SearchMusicScreenState();
}

class _SearchMusicScreenState extends State<SearchMusicScreen> {
  bool searchBarFocused = false;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: _screenWidth,
      color: black,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(height: 40),
            GestureDetector(
              onTap: () {
                if (!searchBarFocused) {
                  setState(() {
                    searchBarFocused = true;
                  });
                }
              },
              child: Container(
                width: _screenWidth,
                height: 50,
                color: darkGrey,
                child: AnimatedPadding(
                  padding: !searchBarFocused ? EdgeInsets.all(5) : EdgeInsets.all(0),
                  duration: Duration(
                    milliseconds: 100,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          color: lightGrey,
                          borderRadius: searchBarFocused ? BorderRadius.circular(0) : BorderRadius.circular(5)),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          searchBarFocused
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      searchBarFocused = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                          searchBarFocused
                              ? Flexible(
                                  child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: TextField(
                                    decoration: InputDecoration(border: InputBorder.none),
                                    style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                                    cursorColor: green,
                                  ),
                                ))
                              : Text("Buscar"),
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
