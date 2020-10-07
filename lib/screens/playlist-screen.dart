import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_clone/services/data.dart';
import 'package:spotify_clone/shared/colors.dart';

class PlaylistScreen extends StatelessWidget {
  final idPlaylist;

  const PlaylistScreen({this.idPlaylist});

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController(initialScrollOffset: 200);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: [0.1, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
              colors: [black, Color.fromRGBO(55, 0, 0, 1)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                background: Column(
                  children: [
                    Container(height: 100),
                    Image.network(
                      playlists[this.idPlaylist].photo,
                      width: 200,
                    ),
                    Container(
                      height: 20,
                    ),
                    Text(
                      playlists[this.idPlaylist].name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
              ),
              title: Text(playlists[this.idPlaylist].name),
              centerTitle: true,
              actions: [
                Icon(Icons.more_vert),
                Container(
                  width: 10,
                ),
              ],
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(
                          title: Text(
                            "sad",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                    childCount: 100))
          ],
        ),
      ),
    );
  }
}
