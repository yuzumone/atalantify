// GENERATED CODE - DO NOT MODIFY BY HAND

part of model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentlyPlaying _$CurrentlyPlayingFromJson(Map<String, dynamic> json) {
  return CurrentlyPlaying()
    ..timestamp = json['timestamp'] as int
    ..progressMs = json['progress_ms'] as int
    ..isPlaying = json['is_playing'] as bool
    ..item = json['item'] == null
        ? null
        : Track.fromJson(json['item'] as Map<String, dynamic>)
    ..currentlyPlayingType = json['currently_playing_type'] as String;
}

Map<String, dynamic> _$CurrentlyPlayingToJson(CurrentlyPlaying instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'progress_ms': instance.progressMs,
      'is_playing': instance.isPlaying,
      'item': instance.item,
      'currently_playing_type': instance.currentlyPlayingType,
    };

Track _$TrackFromJson(Map<String, dynamic> json) {
  return Track()
    ..album = json['album'] == null
        ? null
        : Album.fromJson(json['album'] as Map<String, dynamic>)
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..availableMarkets =
        (json['available_markets'] as List)?.map((e) => e as String)?.toList()
    ..discNumber = json['disc_number'] as int
    ..durationMs = json['duration_ms'] as int
    ..explicit = json['explicit'] as bool
    ..externalUrls = (json['external_urls'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    )
    ..href = json['href'] as String
    ..id = json['id'] as String
    ..isPlayable = json['is_playable'] as bool
    ..name = json['name'] as String
    ..previewUrl = json['preview_url'] as String
    ..trackNumber = json['track_number'] as int
    ..type = json['type'] as String
    ..uri = json['uri'] as String;
}

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'album': instance.album,
      'artists': instance.artists,
      'available_markets': instance.availableMarkets,
      'disc_number': instance.discNumber,
      'duration_ms': instance.durationMs,
      'explicit': instance.explicit,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'is_playable': instance.isPlayable,
      'name': instance.name,
      'preview_url': instance.previewUrl,
      'track_number': instance.trackNumber,
      'type': instance.type,
      'uri': instance.uri,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return Artist()
    ..externalUrls = (json['external_urls'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    )
    ..genres = (json['genres'] as List)?.map((e) => e as String)?.toList()
    ..href = json['href'] as String
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..popularity = json['popularity'] as int
    ..type = json['type'] as String
    ..uri = json['uri'] as String;
}

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'external_urls': instance.externalUrls,
      'genres': instance.genres,
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'popularity': instance.popularity,
      'type': instance.type,
      'uri': instance.uri,
    };

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album()
    ..albumType = json['album_type'] as String
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..availableMarkets =
        (json['available_markets'] as List)?.map((e) => e as String)?.toList()
    ..externalUrls = (json['external_urls'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    )
    ..href = json['href'] as String
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..releaseDate = json['release_date'] as String
    ..releaseDatePrecision = json['release_date_precision'] as String
    ..type = json['type'] as String
    ..uri = json['uri'] as String;
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'album_type': instance.albumType,
      'artists': instance.artists,
      'available_markets': instance.availableMarkets,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'release_date': instance.releaseDate,
      'release_date_precision': instance.releaseDatePrecision,
      'type': instance.type,
      'uri': instance.uri,
    };
