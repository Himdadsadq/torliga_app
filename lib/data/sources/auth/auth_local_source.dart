import 'package:hive/hive.dart';

import '../../../domain/auth/user_entity.dart';

abstract class AuthLocalSource {
  String get boxName;

  Future putUser(User user);

  Future<User?> getUser();
}

class AuthLocalSourceImpl implements AuthLocalSource {
  Box<User>? _box;

  @override
  String get boxName => "user";

  Future<Box<User>> _getBox() async {
    _box ??= await Hive.openBox<User>(boxName);
    return _box!;
  }

  @override
  Future putUser(User user) async {
    var box = await _getBox();
    await box.clear();
    await box.add(user);
  }

  @override
  Future<User?> getUser() async {
    var box = await _getBox();
    if (box.isEmpty || box.values.isEmpty) return null;
    return box.values.first;
  }
}