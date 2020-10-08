import 'package:spotify_clone/models/track.dart';

class Playlist {
  final int id;
  final String name;
  final List<int> musics;
  final String photo;
  bool following;
  final String creator;

  Playlist(this.id, this.name, this.musics, this.photo, this.following, this.creator);
}
