import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// a simple wrapper around FlutterSecureStorage for storing sensetive data
// like user passwords and username

abstract class SecureStorage {
  Future<Map<String, dynamic>> read(String key);
  Future<void> write(String key, Map<String, dynamic> value);
  Future<void> delete(String key);
}

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage secureStorage;
  SecureStorageImpl({@required this.secureStorage});

  @override
  Future<Map<String, dynamic>> read(String key) async {
    String json = await secureStorage.read(key: key);
    Map<String, dynamic> map;
    if (json != null) {
      map = jsonDecode(json);
    }
    return map;
  }

  @override
  Future<void> delete(String key) async {
    await secureStorage.delete(key: key);
  }

  @override
  Future<void> write(String key, Map<String, dynamic> value) async {
    String json = jsonEncode(value);
    await secureStorage.write(key: key, value: json);
  }
}
