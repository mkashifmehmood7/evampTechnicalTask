import 'dart:convert';

import 'package:evamp_task_app/model/profile_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class Preferences {
  static const String kToken = 'Token';
  static const String kUserProfile = 'UserProfile';

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

  static Future saveUserProfile(ProfileModel value) async {
    final data = await storage.write(
        key: kUserProfile, value: jsonEncode(value.toJson()));
    return data;
  }

  static Future<ProfileModel?> getUserProfile() async {
    final data = await storage.read(key: kUserProfile);
    return ProfileModel.fromJson(jsonDecode(data!));
  }

  static Future deleteProfile() async {
    await storage.delete(key: kUserProfile);
  }
}
