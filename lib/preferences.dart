import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class Preferences {
  static const String kToken = 'Token';

  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future setKey(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static Future<String?> getKey(String key) async {
    return await storage.read(key: key);
  }

  static Future clearKey(String key) async {
    await storage.delete(key: key);
  }
}
