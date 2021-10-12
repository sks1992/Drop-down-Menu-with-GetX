class VideoList {
  VideoList({
    required this.list,
    required this.isSuccess,
    this.message,
  });
  late final List<VideoModel> list;
  late final bool isSuccess;
  late final String? message;

  VideoList.fromJson(Map<String, dynamic> json){
    list = List.from(json['list']).map((e)=>VideoModel.fromJson(e)).toList();
    isSuccess = json['isSuccess'];
    message = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['list'] = list.map((e)=>e.toJson()).toList();
    _data['isSuccess'] = isSuccess;
    _data['message'] = message;
    return _data;
  }
}

class VideoModel {
  VideoModel({
    required this.id,
    required this.subject,
    required this.title,
    required this.description,
    required this.uploadTimeStamp,
    required this.fileName,
  });
  late final String id;
  late final String? subject;
  late final String title;
  late final String? description;
  late final String uploadTimeStamp;
  late final String fileName;

  VideoModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    subject = json['subject'];
    title = json['title'];
    description = json['description'];
    uploadTimeStamp = json['uploadTimeStamp'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subject'] = subject;
    _data['title'] = title;
    _data['description'] = description;
    _data['uploadTimeStamp'] = uploadTimeStamp;
    _data['fileName'] = fileName;
    return _data;
  }
}