class ResultModel {
  late bool isSuccess;
  late String message;

  ResultModel(this.isSuccess, this.message);

  ResultModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json["isSuccess"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["isSuccess"] = isSuccess;
    data["message"] = message;
    return data;
  }
}

class IdSvrResultModel {
  late bool isSuccess;
  late String message;

  IdSvrResultModel(this.isSuccess, this.message);

  IdSvrResultModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json["IsSuccess"];
    message = json["Message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["IsSuccess"] = isSuccess;
    data["Message"] = message;
    return data;
  }
}
