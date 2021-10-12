class ResultModel {
  late bool isSuccess;
  late String message;

  ResultModel(this.isSuccess, this.message);

  ResultModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json["isSuccess"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["isSuccess"] = isSuccess;
    data["message"] = message;
    return data;
  }
}