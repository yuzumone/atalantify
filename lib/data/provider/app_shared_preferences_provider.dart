import 'package:atalantify/data/local/app_shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appSharedPreferences =
    Provider<AppSharedPreferences>((ref) => AppSharedPreferences());
