
import 'package:get_storage/get_storage.dart';

class GetStorageKeys {
  static const String keyToken = 'Token';
  static const String userData = 'User';
  static const String keyUserRole = 'keyUserRole';
}

class GetStorageHelper {
  static Future<void> addValue(String key, dynamic value) async {
    await GetStorage().write(key, value);
  }

  static dynamic getValue(String key) {
    return GetStorage().read<dynamic>(key);
  }

  static Future<void> removeValue(String key) async {
    await GetStorage().remove(key);
  }

  static Future<void> clearAll() async {
    await GetStorage().erase();
  }

  static String? getUserRole() {
    return GetStorage().read(GetStorageKeys.keyUserRole);
  }

  // Method to set is Setup Step
  static Future<void> setUserRole(String? value) {
    return GetStorage().write(GetStorageKeys.keyUserRole, value);
  }
}
