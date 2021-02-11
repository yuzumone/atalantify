import 'package:atalantify/data/provider/app_shared_preferences_provider.dart';
import 'package:atalantify/data/repository/preference_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final preferenceRepository = Provider<PreferenceRepository>((ref) =>
    PreferenceRepository(appSharedPreferences: ref.read(appSharedPreferences)));
