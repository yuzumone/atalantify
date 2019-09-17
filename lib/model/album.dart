part of model;

@JsonSerializable()
class Album {
  @JsonKey(name: 'album_type')
  String albumType;
  List<Artist> artists;
  @JsonKey(name: 'available_markets')
  List<String> availableMarkets;
  @JsonKey(name: 'external_urls')
  Map<String, String> externalUrls;
  String href;
  String id;
  String name;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'release_date_precision')
  String releaseDatePrecision;
  String type;
  String uri;

  Album();
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
