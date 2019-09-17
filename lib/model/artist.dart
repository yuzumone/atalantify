part of model;

@JsonSerializable()
class Artist {
  @JsonKey(name: 'external_urls')
  Map<String, String> externalUrls;
  List<String> genres;
  String href;
  String id;
  String name;
  int popularity;
  String type;
  String uri;

  Artist();
  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
