class ProfileList {

  ProfileList({
    this.student,
    this.parents,
    this.address,
    required this.isSuccess,
    required this.message,
  });
  late final Student? student;
  late final List<Parents>? parents;
  late final Address? address;
  late final bool isSuccess;
  late final String? message;

  ProfileList.fromJson(Map<String, dynamic> json){
    student = Student.fromJson(json['student']);
    parents = List.from(json['parents']).map((e)=>Parents.fromJson(e)).toList();
    address = Address.fromJson(json['address']);
    isSuccess = json['isSuccess'];
    message = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['student'] = student!.toJson();
    _data['parents'] = parents!.map((e)=>e.toJson()).toList();
    _data['address'] = address!.toJson();
    _data['isSuccess'] = isSuccess;
    _data['message'] = message;
    return _data;
  }
}

class Student {
  Student({
    required this.userId,
    required this.studentId,
    required this.code,
    required this.name,
    required this.dob,
    required this.gender,
    required this.studentClassId,
    required this.syllabus,
    required this.grade,
    required this.section,
    required this.academicYear,
    required this.school,
    required this.imageUrl,
    required this.mobile,
    required this.email,
    required this.isFirstLogin,
    required this.schoolId,
    required this.academicYearId,
    required this.isSuccess,
    required this.message,
  });
  late final int userId;
  late final int studentId;
  late final String code;
  late final String name;
  late final String dob;
  late final int gender;
  late final int studentClassId;
  late final String syllabus;
  late final String grade;
  late final String section;
  late final String academicYear;
  late final String school;
  late final String imageUrl;
  late final String mobile;
  late final String email;
  late final int isFirstLogin;
  late final int schoolId;
  late final int academicYearId;
  late final bool isSuccess;
  late final String? message;
  late final String?  bloodGroup;

  Student.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    studentId = json['studentId'];
    code = json['code'];
    name = json['name'];
    dob = json['dob'];
    gender = json['gender'];
    studentClassId = json['studentClassId'];
    syllabus = json['syllabus'];
    grade = json['grade'];
    section = json['section'];
    academicYear = json['academicYear'];
    school = json['school'];
    imageUrl = json['imageUrl'];
    mobile = json['mobile'];
    email = json['email'];
    isFirstLogin = json['isFirstLogin'];
    schoolId = json['schoolId'];
    academicYearId = json['academicYearId'];
    isSuccess = json['isSuccess'];
    message = null;
    bloodGroup = json['bloodGroup'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['studentId'] = studentId;
    _data['code'] = code;
    _data['name'] = name;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['studentClassId'] = studentClassId;
    _data['syllabus'] = syllabus;
    _data['grade'] = grade;
    _data['section'] = section;
    _data['academicYear'] = academicYear;
    _data['school'] = school;
    _data['imageUrl'] = imageUrl;
    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['isFirstLogin'] = isFirstLogin;
    _data['schoolId'] = schoolId;
    _data['academicYearId'] = academicYearId;
    _data['isSuccess'] = isSuccess;
    _data['message'] = message;
    _data['bloodGroup'] = message;

    return _data;
  }
}

class Parents {
  Parents({
    required this.name,
    required this.mobile,
    required this.email,
    required this.relation,
  });
  late final String name;
  late final String mobile;
  late final String email;
  late final String relation;

  Parents.fromJson(Map<String, dynamic> json){
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    relation = json['relation'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['relation'] = relation;
    return _data;
  }
}

class Address {
  Address({
    required this.houseNo,
    required this.street,
    required this.city,
    required this.district,
    required this.state,
    required this.pincode,
    required this.phone,
  });
  late final String houseNo;
  late final String street;
  late final String city;
  late final String district;
  late final String state;
  late final String pincode;
  late final String phone;
  late final String mandal ="";//for later use

  Address.fromJson(Map<String, dynamic> json){
    houseNo = json['houseNo'];
    street = json['street'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    pincode = json['pincode'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['houseNo'] = houseNo;
    _data['street'] = street;
    _data['city'] = city;
    _data['district'] = district;
    _data['state'] = state;
    _data['pincode'] = pincode;
    _data['phone'] = phone;
    return _data;
  }
}