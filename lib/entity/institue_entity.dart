class InstituteEntity {
	int instituteSchoolId;
	int schoolId;
	int instituteNum;
	String instituteName;

	InstituteEntity({this.instituteSchoolId, this.schoolId, this.instituteNum, this.instituteName});

	InstituteEntity.fromJson(Map<String, dynamic> json) {
		instituteSchoolId = json['instituteSchoolId'];
		schoolId = json['schoolId'];
		instituteNum = json['instituteNum'];
		instituteName = json['instituteName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['instituteSchoolId'] = this.instituteSchoolId;
		data['schoolId'] = this.schoolId;
		data['instituteNum'] = this.instituteNum;
		data['instituteName'] = this.instituteName;
		return data;
	}
}
