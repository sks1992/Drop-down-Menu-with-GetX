import 'dart:convert';

import 'package:eskool/core/models/assessment_model.dart';
import 'package:eskool/core/models/circular_model.dart';
import 'package:eskool/core/models/class_schedule_model.dart';
import 'package:eskool/core/models/fee_receipts_model.dart';
import 'package:eskool/core/models/profile_model.dart';
import 'package:eskool/core/models/user_model.dart';
import 'package:eskool/core/models/videos_model.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'shared_service.dart';

class AppApi extends GetConnect {
  SharedService _sharedService = Get.find<SharedService>();

  @override
  void onInit() {
    httpClient.baseUrl = Constants.apiBaseUrl;
    httpClient.timeout = Duration(minutes: 1);
    httpClient.addAuthenticator<void>((request) async {
      var _token = await _sharedService.getAccessToken();
      request.headers[Constants.authorizationHeaderName] =
          '${Constants.tokenType} $_token';
      return request;
    });
  }

  Future<UserDataModel> getUserData() async {
    var response = await get("/User/GetUserData");
    if (!response.hasError) {
      var _result = UserDataModel.fromJson(json.decode(response.bodyString!));
      _result.isSuccess = true;
      return _result;
    } else {
      var _result = UserDataModel();
      _result.isSuccess = false;
      _result.message = Constants.getHttpStatusMessage(response);
      return _result;
    }
  }

  Future<AssessmentList> getAssessments() async {
    var response = await get("/Assessment/GetAssessments");
    if (!response.hasError) {
      return AssessmentList.fromJson(json.decode(response.bodyString!));
    } else {
      return AssessmentList(
          isSuccess: false,
          message: Constants.getHttpStatusMessage(response),
          list: []);
    }
  }

  Future<CircularList> getCirculars() async {
    var response = await get("/Documents/GetCirculars");
    if (!response.hasError) {
      return CircularList.fromJson(json.decode(response.bodyString!));
    } else {
      return CircularList(
          isSuccess: false,
          message: Constants.getHttpStatusMessage(response),
          list: []);
    }
  }

  Future<FeeReceiptList> getFeeReceipt() async {
    var response = await get("/Fee/GetFeeReceipts");
    if (!response.hasError) {
      return FeeReceiptList.fromJson(json.decode(response.bodyString!));
    } else {
      return FeeReceiptList(
          isSuccess: false,
          message: Constants.getHttpStatusMessage(response),
          list: []);
    }
  }

  Future<ClassScheduleList> getClassSchedule(String classType) async {
    var response = await get("/OnlineClass/GetOnlineClassSchedule/$classType");
    if (!response.hasError) {
      return ClassScheduleList.fromJson(json.decode(response.bodyString!));
    } else {
      return ClassScheduleList(
          isSuccess: false,
          message: Constants.getHttpStatusMessage(response),
          list: []);
    }
  }

  Future<VideoList> getVideo(String classType) async {
    var response = await get("/OnlineClass/$classType");
    if (!response.hasError) {
      return VideoList.fromJson(json.decode(response.bodyString!));
    } else {
      return VideoList(
          isSuccess: false,
          message: Constants.getHttpStatusMessage(response),
          list: []);
    }
  }

  Future<ProfileList> getProfile() async {
    var response = await get("/OnlineClass/GetStudentProfile");
    if (!response.hasError) {
      return ProfileList.fromJson(json.decode(response.bodyString!));
    } else {
      return ProfileList(
        isSuccess: false,
        message: Constants.getHttpStatusMessage(response),
        address: null,
        parents: [],
        student: null,
      );
    }
  }

}
///OnlineClass/GetOnlineClassVideos///OnlineClass/GetOnlineActivityClassVideos