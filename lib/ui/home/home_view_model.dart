import 'package:atalantify/data/model/device.dart';
import 'package:atalantify/data/model/token.dart';
import 'package:atalantify/data/provider/android_repository_provider.dart';
import 'package:atalantify/data/provider/preference_repository_provder.dart';
import 'package:atalantify/data/provider/spotify_repository_provider.dart';
import 'package:atalantify/data/repository/android_repository.dart';
import 'package:atalantify/data/repository/preference_repository.dart';
import 'package:atalantify/data/repository/spotify_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider(
  (ref) => HomeViewModel(
    ref.read(androidRespositry),
    ref.read(preferenceRepository),
    ref.read(spotifyRepository),
  ),
);

class HomeViewModel extends ChangeNotifier {
  final AndroidRepository _androidRepository;
  final PreferenceRepository _preferenceRepository;
  final SpotifyRepository _spotifyRepository;

  HomeViewModel(this._androidRepository, this._preferenceRepository,
      this._spotifyRepository);

  String _action;
  String get action => _action;
  List<Device> _devices = [];
  List<Device> get devices => _devices;
  bool _transferResult;
  bool get transferResult => _transferResult;

  Future<String> getAction() async {
    return _androidRepository
        .getAction()
        .then((value) => _action = value)
        .whenComplete(notifyListeners);
  }

  Future<Token> _getToken() async {
    var localToken = await _preferenceRepository.getToken();
    if (localToken != null) {
      var token = await _spotifyRepository.refreshAuthToken(localToken);
      await _preferenceRepository.setToken(token);
      return token;
    } else {
      var token = await _spotifyRepository.getAuthToken();
      await _preferenceRepository.setToken(token);
      return token;
    }
  }

  Future<void> storeDeviceId(String deviceId) async {
    await _preferenceRepository.setDeviceId(deviceId);
  }

  Future<void> getDevices() async {
    var token = await _getToken();
    return _spotifyRepository
        .getDevices(token)
        .then((value) => _devices = value)
        .whenComplete(notifyListeners);
  }

  Future<bool> transferPlayback() async {
    var token = await _getToken();
    var deviceId = await _preferenceRepository.getDeviceId();
    return _spotifyRepository
        .transferPlayback(token, deviceId)
        .then((value) => _transferResult = value)
        .whenComplete(notifyListeners);
  }
}
