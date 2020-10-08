import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_clone/services/data.dart';
import 'package:spotify_clone/shared/colors.dart';
import 'package:spotify_clone/shared/widgets/bottom-navigation-bar.dart';

class PlaylistScreen extends StatefulWidget {
  final idPlaylist;

  const PlaylistScreen({this.idPlaylist});

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController _scrollController;
  bool downloadButton;

  double calcOpacityBackground = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController()
      ..addListener(() {
        setState(() {
          calcOpacityBackground = _scrollController.offset;
        });
      });
    downloadButton = false;
  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: [(1 - 100 / (100 - (calcOpacityBackground / 10))).abs(), 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [black, Color.fromRGBO(55, 0, 0, 1)])),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarDefault(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AnimatedOpacity(
              duration: Duration(microseconds: 100),
              opacity: (calcOpacityBackground / 300) < 1 ? (calcOpacityBackground / 300) : 1.0,
              child: Text(playlists[this.widget.idPlaylist].name)),
          centerTitle: true,
          actions: [
            Icon(Icons.more_vert),
            Container(
              width: 10,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: 1 - (1 - 100 / (100 + calcOpacityBackground)),
            child: Container(
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(height: 40),
                  Image.network(
                    playlists[this.widget.idPlaylist].photo,
                    fit: BoxFit.cover,
                    width: 200 - (calcOpacityBackground / 6),
                    height: 200 - (calcOpacityBackground / 6),
                  ),
                  Container(
                    height: 20,
                  ),
                  Text(
                    playlists[this.widget.idPlaylist].name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25 - (calcOpacityBackground / 60)),
                  ),
                  Container(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        playlists[widget.idPlaylist].following = !playlists[widget.idPlaylist].following;
                      });
                    },
                    child: playlists[widget.idPlaylist].following ? FollowingButton() : FollowButton(),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "DE ${playlists[widget.idPlaylist].creator} * 100 SEGUIDORES",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: larguraTela / 1.1),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100, left: 10, right: 10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.01, 0.1],
                              colors: [Colors.transparent, black])),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Baixar"),
                              Switch(
                                value: downloadButton,
                                onChanged: (v) {
                                  setState(() {
                                    downloadButton = v;
                                  });
                                },
                                activeColor: green,
                              )
                            ],
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          child: Image.network(
                                              artists[musics[(playlists[widget.idPlaylist].musics[index]) - 1]
                                                          .id_artist -
                                                      1]
                                                  .photo,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 6,
                                        child: Container(
                                          width: double.maxFinite,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(musics[playlists[widget.idPlaylist].musics[index]].name),
                                              Text(
                                                artists[musics[playlists[widget.idPlaylist].musics[index]].id_artist -
                                                        1]
                                                    .name,
                                                style: TextStyle(fontSize: 13, color: lightGrey),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: playlists[widget.idPlaylist].musics.length - 1),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: larguraTela / 4.5,
                  width: larguraTela / 1.7,
                  top: _scrollController.hasClients
                      ? _scrollController.offset < 405
                          ? larguraTela
                          : _scrollController.offset
                      : larguraTela,
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      alignment: Alignment.center,
                      height: 45,
                      child: Text("ORDEM ALEATÓRIA"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class FollowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 1, color: lightGrey)),
      child: Text(
        "SEGUIR",
        style: TextStyle(fontSize: 11),
      ),
    );
  }
}

class FollowingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 1, color: green)),
      child: Text(
        "SEGUINDO",
        style: TextStyle(fontSize: 11),
      ),
    );
  }
}
