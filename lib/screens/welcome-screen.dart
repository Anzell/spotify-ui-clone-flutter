import 'package:flutter/material.dart';
import 'package:spotify_clone/services/data.dart';
import 'package:spotify_clone/shared/colors.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollController = new ScrollController();
    final screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                Container(
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                  height: 30,
                  alignment: Alignment.centerRight,
                  width: screenSize,
                ),
                Container(
                  child: Text(
                    _getGreeting(),
                    style: TextStyle(fontSize: 25),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: (2.7),
                  children: List.generate(playlists.length, (index) => _constructPlaylistCard(index)),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Tocadas recentemente",
                    style: TextStyle(fontSize: 25),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  height: 10,
                ),
                Container(
                  height: 135,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: playlists.length,
                      itemBuilder: (context, index) => _constructRecentlyPlayedCardPlaylist(index)),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Seus Artistas Favoritos",
                    style: TextStyle(fontSize: 25),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: artists.length,
                    itemBuilder: (context, index) => _constructFavoriteArtistCard(index),
                  ),
                )
              ],
            ),
          ),
        ),
        width: screenSize,
        height: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.75, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topLeft,
                colors: [black, Color.fromRGBO(0, 55, 0, 1)])),
      ),
    );
  }

  String _getGreeting() {
    int hour = DateTime.now().hour - 3;
    if (hour < 12) {
      return "Bom Dia";
    }
    if (hour < 18) {
      return "Boa Tarde";
    }
    return "Boa noite";
  }

  Widget _constructPlaylistCard(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(color: darkGrey, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Container(
              height: double.maxFinite,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),
                child: Image.network(
                  playlists[index].photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  playlists[index].name,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _constructRecentlyPlayedCardPlaylist(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 100,
        height: 120,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.network(
                playlists[index].photo,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Flexible(
              child: Text(
                playlists[index].name,
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _constructFavoriteArtistCard(int index) {
    return Padding(
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  artists[index].photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Text(
              artists[index].name,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        padding: EdgeInsets.only(right: 15));
  }
}
