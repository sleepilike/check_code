import 'package:registration_admin/common/date.dart';

class MonitorRequestEntity {
	int adminId;
	List<int> selectedIds;
	String startTime;
	String endTime;

	MonitorRequestEntity({this.adminId, this.selectedIds, this.startTime, this.endTime});

	MonitorRequestEntity.fromJson(Map<String, dynamic> json) {
		adminId = json['adminId'];
		selectedIds = json['selectedIds']?.cast<int>();
		startTime = json['startTime'];
		endTime = json['endTime'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['adminId'] = this.adminId;
		data['selectedIds'] = this.selectedIds;
		data['startTime'] = this.startTime;
		data['endTime'] = this.endTime;
		return data;
	}
}
