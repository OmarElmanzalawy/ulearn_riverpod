import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearn_riverpod/common/models/entities.dart';
import 'package:ulearn_riverpod/common/utils/constants.dart';

class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  String getString(String key) {
    return _pref.getString(key) ?? 'Couldn\' fetch string';
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }

  Map getUserProfile() {
    String? profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ??
        '{default: default}';
    print(profile);
    var jsonProfile = jsonDecode(profile);
    UserProfile userProfile = UserProfile.fromJson(jsonProfile);
    return jsonProfile;
  }
}
