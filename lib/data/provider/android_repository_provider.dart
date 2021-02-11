import 'package:atalantify/data/repository/android_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final androidRespositry =
    Provider<AndroidRepository>((_) => AndroidRepository());
