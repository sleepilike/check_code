import 'package:registration_admin/common/req_model.dart';
import 'package:registration_admin/config/api.dart';
import 'package:registration_admin/entity/apply_entity.dart';

class ApplyRepo{
   Future getApply(int applicationId)async{
    try{
      var res = await ReqModel.get(API.GETAPPLICATION, {"applicationId":applicationId});
      print("getApply success:"+res.toString());
      return Future.value(ApplyEntity.fromJson(res));
    }catch(error){
      print("getApply error:"+error.toString());
      return Future.error(error);
    }
  }
}