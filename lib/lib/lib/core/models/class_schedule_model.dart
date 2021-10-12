class ClassScheduleList {
  ClassScheduleList({
    required this.list,
    required this.isSuccess,
    required this.message,
  });
  late final List<ClassScheduleModel> list;
  late final bool isSuccess;
  late final String? message;

  ClassScheduleList.fromJson(Map<String, dynamic> json){
    list = List.from(json['list']).map((e)=>ClassScheduleModel.fromJson(e)).toList();
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['list'] = list.map((e)=>e.toJson()).toList();
    _data['isSuccess'] = isSuccess;
    _data['message'] = message;
    return _data;
  }
}

class ClassScheduleModel {
  ClassScheduleModel({
    required this.id,
    required this.subject,
    required this.topic,
    required this.scheduleDate,
    required this.duration,
    required this.attended,
  });
  late final int id;
  late final String subject;
  late final String topic;
  late final String scheduleDate;
  late final int duration;
  late final int attended;

  ClassScheduleModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    subject = json['subject'];
    topic = json['topic'];
    scheduleDate = json['scheduleDate'];
    duration = json['duration'];
    attended = json['attended'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subject'] = subject;
    _data['topic'] = topic;
    _data['scheduleDate'] = scheduleDate;
    _data['duration'] = duration;
    _data['attended'] = attended;
    return _data;
  }
}