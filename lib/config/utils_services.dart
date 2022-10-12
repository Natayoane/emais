import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UtilsServices {

  final storage = FlutterSecureStorage();

  Future<void> saveLocalData({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> getLocalData({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> removeLocalData({required String key}) async {
    return storage.delete(key: key);
  }

}