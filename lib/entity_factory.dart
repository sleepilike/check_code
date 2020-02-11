import 'package:registration_admin/entity/user_entity.dart';
import 'package:registration_admin/entity/worker_entity.dart';
import 'package:registration_admin/entity/monitor_request_entity.dart';
import 'package:registration_admin/entity/institue_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else if (T.toString() == "WorkerEntity") {
      return WorkerEntity.fromJson(json) as T;
    } else if (T.toString() == "MonitorRequestEntity") {
      return MonitorRequestEntity.fromJson(json) as T;
    } else if (T.toString() == "InstituteEntity") {
      return InstituteEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}