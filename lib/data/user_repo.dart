

import 'package:registration_admin/common/req_model.dart';
import 'package:registration_admin/entity/institue_entity.dart';
import 'package:registration_admin/entity/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/api.dart';

const KEY_PASSWORD = "password";
const KEY_USERNAME = "username";
class UserRepo {
  Future init() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String account = sp.getString(KEY_USERNAME);
      String password  = sp.getString(KEY_PASSWORD);

      print('初始化， 获取账号：' + account);
      if (account == null || password == null)
        return Future.error('无初始登陆状态');
      return login(account, password);
    } catch (error) {
      return Future.error(error);
    }
  }

  Future login(String username, String password) async {
    try {
      var res = await ReqModel.post(API.LOGIN, {"account": username, "password": password});
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(KEY_PASSWORD, password);
      sp.setString(KEY_USERNAME, username);

      return Future.value(UserEntity.fromJson(res));
    } catch (error) {
      return Future.error(error);
    }
  }

  /// 登出，清除sp
  void logout() {

  }

}