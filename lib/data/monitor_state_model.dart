
import 'package:flutter/foundation.dart';
import 'package:registration_admin/common/check.dart';
import 'package:registration_admin/common/date.dart';
import 'package:registration_admin/entity/institue_entity.dart';
import 'package:registration_admin/entity/monitor_request_entity.dart';
import 'package:registration_admin/entity/worker_entity.dart';

import 'monitor_repo.dart';


/// 监控信息状态管理类
/// 主要功能：1.根据筛选条件获取监控信息和导出excel；
///          2. 保存筛选条件和选中机构
///          3. 初始化机构列表
class MonitorStateModel extends ChangeNotifier {
  MonitorRepo _repository = MonitorRepo();
  List<WorkerEntity> _resultList;
  MonitorRequestEntity _requestEntity = MonitorRequestEntity(
    startTime: DateUtil.nowDateString(),
    endTime: DateUtil.nowDateString()
  );
  List<InstituteEntity> _institutes = [];

  static const ROLE_SCHOOL = 1;

  List<InstituteEntity> get institutes => _institutes;
  MonitorRequestEntity get requestEntity => _requestEntity;
  List<WorkerEntity> get resultList => _resultList;
  get selectedIds => _requestEntity.selectedIds;
  get isRegister => listNoEmpty(_resultList);

  bool get hasMonitorInfo => listNoEmpty(_resultList); // 是否有记录

  init(adminId, role) async{
    print('MonitorStateModel init exec');
    _requestEntity.adminId = adminId;
    try {
      _resultList = await _repository.getListByAdminId(adminId);

      /// 如果为院初始化机构列表
      if (role == ROLE_SCHOOL)
        _institutes = await _repository.getInstitutes(adminId);
      notifyListeners();
    } catch(error) {
      print('init error:' + error.toString());
      // 初始化错误
      // 不需要处理
    }
  }

  Future refreshData(MonitorRequestEntity requestEntity) async {
    try {
      _resultList = await _repository.getList(requestEntity);
      _requestEntity = requestEntity;
      notifyListeners();
      return Future.value();
    } catch (error) {
      return Future.error(error);
    }
  }

  Future exportExcel() {
    return _repository.getExcelUrl(_requestEntity);
  }

}