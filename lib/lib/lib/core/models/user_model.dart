class UserDataModel {
  late String code;
  late String name;
  late int gender;
  late String syllabus;
  late String grade;
  late String section;
  late String academicYear;
  late String mobile;
  late bool isSuccess;
  late String message;

  UserDataModel(
      {this.code = "",
      this.name = "",
      this.gender = 0,
      this.syllabus = "",
      this.grade = "",
      this.section = "",
      this.academicYear = "",
      this.mobile = ""});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    gender = json['gender'];
    syllabus = json['syllabus'];
    grade = json['grade'];
    section = json['section'];
    academicYear = json['academicYear'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['syllabus'] = this.syllabus;
    data['grade'] = this.grade;
    data['section'] = this.section;
    data['academicYear'] = this.academicYear;
    data['mobile'] = this.mobile;
    return data;
  }
}
