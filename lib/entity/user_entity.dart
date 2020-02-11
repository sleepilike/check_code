class UserEntity {
	String adminName;
	int adminId;
	String institute;
	int staffNum;
	int fillNum;
  int role;

	UserEntity({this.adminName, this.adminId, this.institute, this.staffNum, this.fillNum});

	UserEntity.fromJson(Map<String, dynamic> json) {
		adminName = json['adminName'];
		adminId = json['adminId'];
		institute = json['institute'];
		staffNum = json['staffNum'];
		fillNum = json['fillNum'];
		role = json['role'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['adminName'] = this.adminName;
		data['adminId'] = this.adminId;
		data['institute'] = this.institute;
		data['staffNum'] = this.staffNum;
		data['fillNum'] = this.fillNum;
		return data;
	}
}
