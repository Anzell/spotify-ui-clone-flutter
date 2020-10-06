import 'package:spotify_clone/models/artist.dart';
import 'package:spotify_clone/models/track.dart';
import 'package:spotify_clone/models/playlist.dart';

List<Artist> artists = [
  Artist(1, "David Guetta",
      "https://yt3.ggpht.com/a/AATXAJwynR-Zy3E4kcZkLrl4DfepJyYhSAYEIK8b-GNakg=s900-c-k-c0xffffffff-no-rj-mo"),
  Artist(2, "Supercombo",
      "https://studiosol-a.akamaihd.net/uploadfile/letras/fotos/a/4/2/0/a4206acc1cb92ab918f1daba1d255a25.jpg"),
  Artist(3, "The White Buffalo",
      "https://studiosol-a.akamaihd.net/uploadfile/letras/fotos/0/8/9/e/089e84f81108317baafd3d6fb07cea3c.jpg")
];

List<Track> musics = [
  Track(1, 1, "Titanium"),
  Track(2, 1, "Hey Mama"),
  Track(3, 1, "She Wolf"),
  Track(4, 1, "Flames"),
  Track(5, 2, "Amianto"),
  Track(6, 2, "Piloto Automático"),
  Track(7, 2, "Sol da Manhã"),
  Track(8, 2, "Maremotos"),
  Track(9, 3, "Come join the murder"),
  Track(10, 3, "I got You"),
  Track(11, 3, "Oh Darlin, What Have I Done"),
  Track(12, 3, "The Whistler"),
  Track(13, 3, "The Woods"),
];

List<Playlist> playlists = [
  Playlist(1, "Músicas do David Guetta", [1, 2, 3, 4],
      "https://linkstorage.linkfire.com/medialinks/images/2c99bb56-7308-418a-b83b-77e87a19e841/artwork-440x440.jpg"),
  Playlist(2, "Musicas Favoritas", [1, 6, 9, 13],
      "https://studiosol-a.akamaihd.net/tb/letras-blog/wp-content/uploads/2019/10/d582d79-musicas_de_desenhos_dos_anos_80_1390x780-300x168.jpg"),
  Playlist(
      3, "Músicas do Supercombo", [5, 6, 7, 8], "https://i.scdn.co/image/ab67706f00000003cb7513b2a093f68cd8d13428"),
  Playlist(4, "Músicas do The White Buffalo", [9, 10, 11, 12, 13],
      "https://exclaim.ca/images/white-buffalo-widows-walk.jpg"),
  Playlist(5, "Todas as músicas", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13],
      "https://m.epochtimes.com.br/assets/uploads/2014/08/ct-musica-favorita-900-795x447.jpg"),
  Playlist(6, "Playlist com uma música", [12], "https://cobizz.com.br/wp-content/uploads/2019/01/musicaok-780x405.jpg")
];
