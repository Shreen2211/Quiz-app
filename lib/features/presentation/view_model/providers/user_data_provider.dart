import 'package:flutter_riverpod/legacy.dart';
import 'package:quiz_app/features/data/data_sources/local/AppPrefs.dart';

final userName = StateProvider<String>(
  (ref) => AppPrefs.getUsername() ?? 'Enter Name',
);

final userRate = StateProvider<int>((ref) => AppPrefs.getUserRate() ?? 0);
