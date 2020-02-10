

import 'package:registration_admin/common/req_model.dart';

import '../config/api.dart';

class UserRepo {
  Future login(String username, String password) {
    return ReqModel.post(API.LOGIN, {"account": username, "password": password});
  }
}