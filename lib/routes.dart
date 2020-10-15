import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/artist-screen.dart';
import 'package:spotify_clone/screens/login-screen.dart';
import 'package:spotify_clone/screens/main-screen.dart';
import 'package:spotify_clone/screens/playlist-screen.dart';
import 'package:spotify_clone/screens/search-music-screen.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case "/main-screen":
        return PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return MainScreen(
            resource: args['resource'],
          );
        });
        break;
      case "/playlist":
        return PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return PlaylistScreen(
            idPlaylist: args['idPlaylist'],
          );
        });
        break;
      case "/artist":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => ArtistScreen(
            idArtist: args['idArtist'],
          ),
        );
        break;
      case "/search-screen":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => SearchMusicScreen(),
        );
        break;
      default:
        return _error();
    }
  }

  static Route<dynamic> _error() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(body: Center(child: Text("Esta rota não é válida !")));
    });
  }
}
