part of model;

@JsonSerializable()
class Track {
  Album album;
  List<Artist> artists;
  @JsonKey(name: 'available_markets')
  List<String> availableMarkets;
  @JsonKey(name: 'disc_number')
  int discNumber;
  @JsonKey(name: 'duration_ms')
  int durationMs;
  bool explicit;
  @JsonKey(name: 'external_urls')
  Map<String, String> externalUrls;
  String href;
  String id;
  @JsonKey(name: 'is_playable')
  bool isPlayable;
  String name;
  @JsonKey(name: 'preview_url')
  String previewUrl;
  @JsonKey(name: 'track_number')
  int trackNumber;
  String type;
  String uri;

  Track();
  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
