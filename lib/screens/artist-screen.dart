import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_clone/services/data.dart';
import 'package:spotify_clone/shared/colors.dart';
import 'package:spotify_clone/shared/widgets/music-list.dart';

class ArtistScreen extends StatefulWidget {
  final int idArtist;

  const ArtistScreen({this.idArtist});

  @override
  _ArtistScreenState createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
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
    final _larguraTela = MediaQuery.of(context).size.width;
    return MusicList(
      titleAppBar: artists[widget.idArtist].name,
      scrollController: _scrollController,
      calcOpacityBackground: calcOpacityBackground,
      actionsAppBar: [FollowArtistButton(), Icon(Icons.more_vert)],
      backgroundColumn: Stack(
        children: [
          Opacity(
              opacity: 0.5,
              child: Image.network(
                artists[widget.idArtist].photo,
                fit: BoxFit.cover,
                height: (_larguraTela + 100) - (calcOpacityBackground / 10),
                width: (_larguraTela + 100) - (calcOpacityBackground / 10),
              )),
          Container(
            width: _larguraTela,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  artists[widget.idArtist].name,
                  style: TextStyle(fontSize: 40 - (calcOpacityBackground / 60), color: Colors.white),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  "XXXX OUVINTES MENSAIS",
                  style: TextStyle(color: lightGrey, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
      musicBuilder: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => CardMusic(
          index: index,
          idArtist: widget.idArtist,
        ),
        itemCount: musics.where((e) => e.id_artist == widget.idArtist + 1).length,
      ),
      musicListColumn: [
        Text(
          "Popular",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}

class CardMusic extends StatelessWidget {
  final int index;
  final int idArtist;

  const CardMusic({this.index, this.idArtist});

  @override
  Widget build(BuildContext context) {
    final _larguraTela = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(children: [
        Container(child: Text("${this.index + 1}")),
        Container(
          width: 5,
        ),
        Container(
            width: 50,
            height: 50,
            child: Image.network(
              artists[musics.where((e) => e.id_artist == idArtist + 1).toList()[index].id_artist - 1].photo,
              fit: BoxFit.cover,
            )),
        Container(
          width: 5,
        ),
        Flexible(
          child: Container(
            width: _larguraTela / 1.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(musics.where((e) => e.id_artist == idArtist + 1).toList()[index].name),
                Text(
                  (Random().nextInt(10000).toString()),
                  style: TextStyle(fontSize: 13, color: lightGrey),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}

class FollowArtistButton extends StatefulWidget {
  @override
  _FollowArtistButtonState createState() => _FollowArtistButtonState();
}

class _FollowArtistButtonState extends State<FollowArtistButton> {
  bool following;

  @override
  void initState() {
    super.initState();
    this.following = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          following = !following;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
          decoration: BoxDecoration(
              border: following ? Border.all(color: Colors.white, width: 2) : null,
              borderRadius: BorderRadius.circular(5),
              color: !following ? lightGrey.withOpacity(0.3) : Colors.transparent),
          child: Text(
            this.following ? "SEGUINDO" : "SEGUIR",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
