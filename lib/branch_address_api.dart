import 'dart:convert';

import 'package:get/get.dart';

import 'barnch_address_model.dart';

class BranchAddressApi extends GetConnect {

  Future<BranchAddress> getBranchAddress() async {
    var response = await get("http://jacinthfinvest.com/Mobile/GetBranchAddress");
    return BranchAddress.fromJson(json.decode(response.bodyString!));
  }

}