part of model;

@JsonSerializable()
class CurrentlyPlaying {
  int timestamp;
  @JsonKey(name: 'progress_ms')
  int progressMs;
  @JsonKey(name: 'is_playing')
  bool isPlaying;
  Track item;
  @JsonKey(name: 'currently_playing_type')
  String currentlyPlayingType;

  CurrentlyPlaying();
  factory CurrentlyPlaying.fromJson(Map<String, dynamic> json) => _$CurrentlyPlayingFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentlyPlayingToJson(this);
}
