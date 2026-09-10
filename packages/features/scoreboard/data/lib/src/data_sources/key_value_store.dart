/// The bottom of this layer. Keeps the platform plugin at the edge of the app, which is
/// what lets the data layer be tested without a Flutter binding.
abstract interface class KeyValueStore {
  Future<String?> read(String key);

  Future<void> write(String key, String value);
}
