// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class GetTokens {
//   final FlutterSecureStorage _storage = FlutterSecureStorage();
//
//   Future<Map<String, String>> getTokens() async {
//     final sessionId = await _storage.read(key: 'sessionId') ?? 'No sessionId';
//
//     return {
//       'connect.sid': sessionId};
//   }
//
//   Future<void> deleteToken(String key) async {
//     await _storage.delete(key: key);
//   }
//
//   Future<void> clearAllTokens() async {
//     await _storage.delete(key: 'sessionId');
//   }
// }
//


import 'package:shared_preferences/shared_preferences.dart';

class GetTokens {
  Future<Map<String, String>> getTokens() async {
    final prefs = await SharedPreferences.getInstance();
    final sessionId = prefs.getString('sessionId') ?? 'No sessionId';

    return {
      'connect.sid': sessionId,
    };
  }

  Future<void> deleteToken(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> clearAllTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('sessionId');
  }

  // Function to retrieve the accessToken
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  // Function to retrieve the refreshToken
  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refreshToken');
  }
}
