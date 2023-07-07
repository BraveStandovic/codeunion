import 'dart:async';
import 'dart:convert';

import 'package:data_provider/data_provider.dart';

import 'model/model.dart';

class UserRepository {
  User? _user;

  Future<void> setUser({User? user}) {
    _user = user;
    final storage = SecureStorage();
    if (user == null) {
      return storage.delete(key: StorageKeys.user);
    } else {
      final encodedUser = jsonEncode(user.toJson());
      return storage.write(key: StorageKeys.user, value: encodedUser);
    }
  }

  Future<User?> getUser() async {
    if (_user != null) return _user;
    final storage = SecureStorage();
    final userString = await storage.read(key: StorageKeys.user);
    if (userString == null) return null;
    final decodedUser = jsonDecode(userString);
    _user = User.fromJson(decodedUser);
    return _user;
  }
}
