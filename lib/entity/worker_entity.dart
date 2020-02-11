class WorkerEntity {
	String closeStatus;
	String workerName;
	String workerCurAdd;
	String status;

	WorkerEntity({this.closeStatus, this.workerName, this.workerCurAdd, this.status});

	WorkerEntity.fromJson(Map<String, dynamic> json) {
		closeStatus = json['closeStatus'];
		workerName = json['workerName'];
		workerCurAdd = json['workerCurAdd'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['closeStatus'] = this.closeStatus;
		data['workerName'] = this.workerName;
		data['workerCurAdd'] = this.workerCurAdd;
		data['status'] = this.status;
		return data;
	}

	static List<WorkerEntity> fromJsonList(var json) {
		List<WorkerEntity> list = List();
		json.forEach((element) { list.add(WorkerEntity.fromJson(element)); });
		return list;
	}
}
