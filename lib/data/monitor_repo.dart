import 'package:registration_admin/common/req_model.dart';
import 'package:registration_admin/config/api.dart';
import 'package:registration_admin/entity/institue_entity.dart';
import 'package:registration_admin/entity/monitor_request_entity.dart';
import 'package:registration_admin/entity/worker_entity.dart';

class MonitorRepo {
  Future getList(MonitorRequestEntity requestEntity) async {
    try {
      var res = await ReqModel.post(API.MONITOR_LIST, requestEntity.toJson());
      print('getlist success:' + res.toString());
      return Future.value(WorkerEntity.fromJsonList(res));
    } catch (error) {
      print('getList error:' + error.toString());
      return Future.error(error);
    }
  }

  Future getListByAdminId(adminId) {
    return getList(MonitorRequestEntity(adminId: adminId));
  }

  Future getInstitutes(int adminId) async {
    try {
      Map request = Map();
      request["adminId"] = adminId;
      var res = await ReqModel.get(API.INSTITUTE, {"adminId": adminId});
//      var res = await ReqModel.get(API.INSTITUTE, request);
      print(res.toString());
      return Future.value(InstituteEntity.fromJsonList(res));
    } catch (error) {
      print('InstituteRepo error: ' + error.toString());
      return Future.error(error);
    }
  }

  Future getExcelUrl(MonitorRequestEntity requestEntity) async {
    try {
      String url =
          await ReqModel.post(API.EXPORT_EXCEL, requestEntity.toJson());
      return Future.value(API.RESOURCE_PATH + url);
    } catch (error) {
      return Future.error(error);
    }
  }
}
