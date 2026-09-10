import 'package:scoreboard_data/scoreboard_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The only place in the repository that knows about `shared_preferences`.
///
/// `SharedPreferencesAsync` is used rather than the legacy instance API so composition
/// stays synchronous — nothing has to be awaited before the first frame.
class SharedPreferencesStore implements KeyValueStore {
  const SharedPreferencesStore({required this.preferences});

  final SharedPreferencesAsync preferences;

  @override
  Future<String?> read(String key) => preferences.getString(key);

  @override
  Future<void> write(String key, String value) => preferences.setString(key, value);
}
