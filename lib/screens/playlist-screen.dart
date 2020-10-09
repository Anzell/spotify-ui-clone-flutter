import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_clone/services/data.dart';
import 'package:spotify_clone/shared/colors.dart';
import 'package:spotify_clone/shared/widgets/bottom-navigation-bar.dart';
import 'package:spotify_clone/shared/widgets/music-list.dart';

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
    return MusicList(
      scrollController: _scrollController,
      calcOpacityBackground: calcOpacityBackground,
      titleAppBar: playlists[this.widget.idPlaylist].name,
      musicBuilder: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CardMusic(
                idPlaylist: widget.idPlaylist,
                index: index,
              ),
          itemCount: playlists[widget.idPlaylist].musics.length - 1),
      actionsAppBar: [
        Icon(Icons.more_vert),
        Container(
          width: 10,
        ),
      ],
      musicListColumn: [
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
      ],
      backgroundColumn: Column(
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
            child: playlists[widget.idPlaylist].following
                ? FollowButton(
                    borderColor: green,
                    label: "SEGUINDO",
                  )
                : FollowButton(
                    borderColor: lightGrey,
                    label: "SEGUIR",
                  ),
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
    );
  }
}

class CardMusic extends StatelessWidget {
  final index;
  final idPlaylist;

  const CardMusic({this.index, this.idPlaylist});

  @override
  Widget build(BuildContext context) {
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
              child: Image.network(artists[musics[(playlists[idPlaylist].musics[index]) - 1].id_artist - 1].photo,
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
                  Text(musics[playlists[idPlaylist].musics[index]].name),
                  Text(
                    artists[musics[playlists[idPlaylist].musics[index]].id_artist - 1].name,
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
  }
}

class FollowButton extends StatelessWidget {
  final Color borderColor;
  final String label;

  const FollowButton({this.borderColor, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 1, color: borderColor)),
      child: Text(
        label,
        style: TextStyle(fontSize: 11),
      ),
    );
  }
}
