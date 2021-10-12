class AssessmentList {
  AssessmentList({
    required this.list,
    required this.isSuccess,
    required this.message,
  });

  late final List<AssessmentModel> list;
  late final bool isSuccess;
  late final String message;

  AssessmentList.fromJson(Map<String, dynamic> json) {
    list = List.from(json['list'])
        .map((e) => AssessmentModel.fromJson(e))
        .toList();
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

class AssessmentModel {
  AssessmentModel({
    required this.id,
    required this.assignmentName,
    required this.subject,
    required this.assignmentDate,
    required this.answerSheetsSubmitDateTime,
    required this.marks,
    required this.fileName,
    required this.timeSlot,
    required this.answerSheets,
  });

  late final String id;
  late final String assignmentName;
  late final String subject;
  late final String assignmentDate;
  late final String answerSheetsSubmitDateTime;
  late final int marks;
  late final String fileName;
  late final String timeSlot;
  late final int answerSheets;

  AssessmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignmentName = json['assignmentName'];
    subject = json['subject'];
    assignmentDate = json['assignmentDate'];
    answerSheetsSubmitDateTime = json['answerSheetsSubmitDateTime'];
    marks = json['marks'];
    fileName = json['fileName'];
    timeSlot = json['timeSlot'];
    answerSheets = json['answerSheets'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['assignmentName'] = assignmentName;
    _data['subject'] = subject;
    _data['assignmentDate'] = assignmentDate;
    _data['answerSheetsSubmitDateTime'] = answerSheetsSubmitDateTime;
    _data['marks'] = marks;
    _data['fileName'] = fileName;
    _data['timeSlot'] = timeSlot;
    _data['answerSheets'] = answerSheets;
    return _data;
  }
}
