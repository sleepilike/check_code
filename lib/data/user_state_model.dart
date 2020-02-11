

import 'package:flutter/foundation.dart';
import 'package:registration_admin/entity/user_entity.dart';

import 'user_repo.dart';

class UserStateModel extends ChangeNotifier {
  UserRepo _repository = UserRepo();
  UserEntity _user;
  bool _autoLogin = false;


  UserEntity get user => _user;

  bool get autoLogin => _autoLogin;

  bool get isLogin => _user != null;

  Future init () async {
    try {
      _user = await _repository.init();

      _autoLogin = true;
      notifyListeners();
      return Future.value();
    } catch(error) {
      // 无记录账号密码
    }
  }

  Future login(String account, String password) async {
    try {
      _user = await _repository.login(account, password);

      notifyListeners();
      return Future.value();
    } catch (error) {
      return Future.error(error);
    }
  }
}