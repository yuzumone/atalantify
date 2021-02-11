import 'package:atalantify/data/repository/spotify_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final spotifyRepository =
    Provider<SpotifyRepository>((_) => SpotifyRepository(client: Client()));
