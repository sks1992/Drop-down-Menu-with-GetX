class CircularList {
  CircularList({
    required this.list,
    required this.isSuccess,
    required this.message,
  });

  late final List<CircularModel> list;
  late final bool isSuccess;
  late final String? message;

  CircularList.fromJson(Map<String, dynamic> json) {
    list =
        List.from(json['list']).map((e) => CircularModel.fromJson(e)).toList();
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['list'] = list.map((e) => e.toJson()).toList();
    _data['isSuccess'] = isSuccess;
    _data['message'] = message;
    return _data;
  }
}

class CircularModel {
  CircularModel({
    required this.id,
    required this.uploadDate,
    required this.circularName,
    required this.circularPath,
    required this.description,
    required this.classLevelId,
  });

  late final int id;
  late final String uploadDate;
  late final String circularName;
  late final String circularPath;
  late final String description;
  late final String classLevelId;

  CircularModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uploadDate = json['uploadDate'];
    circularName = json['circularName'];
    circularPath = json['circularPath'];
    description = json['description'];
    classLevelId = json['classLevelId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['uploadDate'] = uploadDate;
    _data['circularName'] = circularName;
    _data['circularPath'] = circularPath;
    _data['description'] = description;
    _data['classLevelId'] = classLevelId;
    return _data;
  }
}
