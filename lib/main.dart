import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'branch_address_api.dart';
import 'home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put<BranchAddressApi>(BranchAddressApi());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

/*
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jfl_app/core/models/branch_address.dart';

class PublicApi {
  static const baseUrl = "http://jacinthfinvest.com";

  static var _opts = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 60 * 1000,
    sendTimeout: 60 * 1000,
  );
  var _dio = Dio(_opts)
    ..interceptors.clear()
    ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  Future<BranchAddress> getBranchAddress() async {
    var response = await _dio.get("/Mobile/GetBranchAddress");
    return BranchAddress.fromJson(json.decode(response.toString()));
  }
}
===================================================================
class BranchAddress {
  List<States>? states;
  List<Districts>? districts;
  List<Branches>? branches;
  bool? isSuccess =true;
  String? message;

  BranchAddress(
      {this.states,
      this.districts,
      this.branches,
      this.isSuccess,
      this.message});

  BranchAddress.fromJson(Map<String, dynamic> json) {
    if (json['States'] != null) {
      states = [];
      json['States'].forEach((v) {
        states?.add(States.fromJson(v));
      });
    }
    if (json['Districts'] != null) {
      districts = [];
      json['Districts'].forEach((v) {
        districts?.add(Districts.fromJson(v));
      });
    }
    if (json['Branches'] != null) {
      branches = [];
      json['Branches'].forEach((v) {
        branches?.add(Branches.fromJson(v));
      });
    }
    if (json['isSuccess'] != null) {
      branches = [];
      json['isSuccess'].forEach((v) {
        branches?.add(Branches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (states != null) {
      data['States'] = states?.map((v) => v.toJson()).toList();
    }
    if (districts != null) {
      data['Districts'] = districts?.map((v) => v.toJson()).toList();
    }
    if (branches != null) {
      data['Branches'] = branches?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  int? id;
  String? name;

  States({this.id, this.name});

  States.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}

class Districts {
  int? stateId;
  int? id;
  String? name;

  Districts({this.stateId, this.id, this.name});

  Districts.fromJson(Map<String, dynamic> json) {
    stateId = json['StateId'];
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StateId'] = stateId;
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}

class Branches {
  int? districtId;
  String? address;
  int? id;
  String? name;

  Branches({this.districtId, this.address, this.id, this.name});

  Branches.fromJson(Map<String, dynamic> json) {
    districtId = json['DistrictId'];
    address = json['Address'];
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['DistrictId'] = districtId;
    data['Address'] = address;
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}
import 'dart:convert';

import 'package:get/get.dart';
import 'package:jfl_client/core/models/branch_address.dart';
import 'package:jfl_client/ui/drop_down_view/dropdown_model.dart';

//create a apiRequest for get Branch Address data
class AppApi extends GetConnect {
  //create a Future  function getBranchBAddress
  Future<BranchAddress> getBranchAddress() async {
    var response =
        await get("http://jacinthfinvest.com/Mobile/GetBranchAddress");

    if(!response.hasError){
      return BranchAddress.fromJson(json.decode(response.bodyString!));
    } else {
      return BranchAddress(
        isSuccess: false,
        message: 'Error',
        states: [],
        districts: [],
        branches: [],
      );
    }
  }
}

=================================================================================
import 'package:get/get.dart';
import 'package:jfl_client/core/models/branch_address.dart';
import 'package:jfl_client/core/services/public_api.dart';

import 'dropdown_model.dart';

class SampleController extends GetxController  {
  final _apiApi = Get.find<AppApi>();

DropDownModel downModel =DropDownModel();


  final _states = Rx<List<DropDownModel>>([]);
  final _districts = Rx<List<DropDownModel>>([]);


  List<DropDownModel> get states => _states.value;

  List<DropDownModel> get districts => _districts.value;

  var stateDropDownValue = "0".obs;
  var districtDropDownValue = "0".obs;
  var branchDropDownValue = "0".obs;



  void _setData() {
    _states.value = branchAddress.states;
    _states.value.add(DropDownModel(id: 0, name: "Select"));
    _states.value.add(DropDownModel(id: 1, name: "Telangana"));
    _states.value.add(DropDownModel(id: 2, name: "Andhra Pradesh"));
  }

  void setDistricts() {
    _districts.value.clear();
    if (stateDropDownValue.value == "1") {
      _districts.value.add(DropDownModel(id: 0, name: "Select"));
      _districts.value.add(DropDownModel(id: 1, name: "District T1"));
      _districts.value.add(DropDownModel(id: 2, name: "District T2"));
    } else if (stateDropDownValue.value == "2") {
      _districts.value.add(DropDownModel(id: 0, name: "Select"));
      _districts.value.add(DropDownModel(id: 1, name: "District A1"));
      _districts.value.add(DropDownModel(id: 2, name: "District A2"));
    } else {
      _districts.value.add(DropDownModel(id: 0, name: "Select"));
    }
    districtDropDownValue.value = "0";
  }

  void setBranches() {
    _districts.value.clear();
    if (stateDropDownValue.value == "1") {
      _districts.value.add(DropDownModel(id: 0, name: "Select"));
      _districts.value.add(DropDownModel(id: 1, name: "District T1"));
      _districts.value.add(DropDownModel(id: 2, name: "District T2"));
    } else if (stateDropDownValue.value == "2") {
      _districts.value.add(DropDownModel(id: 0, name: "Select"));
      _districts.value.add(DropDownModel(id: 1, name: "District A1"));
      _districts.value.add(DropDownModel(id: 2, name: "District A2"));
    } else {
      _districts.value.add(DropDownModel(id: 0, name: "Select"));
    }
    branchDropDownValue.value = "0";
  }

  @override
  void onInit() {
    _setData();
    _apiApi.getBranchAddress();
    super.onInit();
  }


}

=============================================================

import 'package:flutter/material.dart';
import 'package:jfl_app/core/models/branch_address.dart';
import 'package:jfl_app/core/viewmodels/branch_address_viewmodel.dart';
import 'package:jfl_app/ui/widgets/description.dart';
import 'package:jfl_app/ui/widgets/dot_progress_indicator.dart';
import 'package:jfl_app/ui/widgets/label.dart';
import 'package:jfl_app/ui/widgets/title.dart';
import 'package:provider/provider.dart';

class BranchAddressDropDowns extends StatefulWidget {
  @override
  _BranchAddressDropDownsState createState() => _BranchAddressDropDownsState();
}

class _BranchAddressDropDownsState extends State<BranchAddressDropDowns> {
  int _selectedState;
  int _selectedDistrict;
  int _selectedBranch;
  String _selectedBranchAddress = "";

  List<DropdownMenuItem> _districtItems = [];
  List<DropdownMenuItem> _branchItems = [];

  Future<void> _getBranchAddressFuture;
  BranchAddress _branchAddress;

  @override
  void didChangeDependencies() {
    _getBranchAddressFuture =
        Provider.of<BranchAddressViewModel>(context, listen: false)
            .getBranchAddress();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("********* Branch Address Dropdown View Build ***********");
    return FutureBuilder(
      future: _getBranchAddressFuture,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return DotProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('An error occurred!'),
          );
        } else {
          return Consumer<BranchAddressViewModel>(
              builder: (ctx, _addressModel, child) {
            _branchAddress = _addressModel.branchAddress;
            return _addressModel.branchAddress == null
                ? SizedBox() //to handle _addressModel.branchAddress  null exception only
                : !_addressModel.branchAddress.isSuccess
                    ? DescriptionText(_addressModel.branchAddress.message)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const LabelText("State: "),
                          DropdownButton(
                            isExpanded: true,
                            hint: const DescriptionText("Select State"),
                            items:
                                _getStates(_addressModel.branchAddress.states),
                            value: _selectedState,
                            onChanged: (value) {
                              _onStateChanged(value);
                            },
                          ),
                          const SizedBox(height: 8.0),
                          const LabelText("District: "),
                          DropdownButton(
                            isExpanded: true,
                            hint: const DescriptionText("Select District"),
                            items: _districtItems,
                            value: _selectedDistrict,
                            onChanged: (value) {
                              _onDistrictChanged(value);
                            },
                          ),
                          const SizedBox(height: 8.0),
                          const LabelText("Branch: "),
                          DropdownButton(
                            isExpanded: true,
                            hint: const DescriptionText("Select Branch"),
                            items: _branchItems,
                            value: _selectedBranch,
                            onChanged: (value) {
                              _onBranchChanged(value);
                            },
                          ),
                          const SizedBox(height: 8.0),
                          if (_selectedBranchAddress.isNotEmpty)
                            TitleText("Address: "),
                          DescriptionText(_selectedBranchAddress),
                        ],
                      );
          });
        }
      },
    );
  }

  List<DropdownMenuItem> _getStates(List<States> states) {
    final _defaultItem = _getDefaultDropdownItem("State");
    final _states = states
        .map((s) =>
            DropdownMenuItem(value: s.id, child: DescriptionText(s.name)))
        .toList();

    if (_states != null) {
      _states.insert(0, _defaultItem);
      return _states;
    } else {
      return [_defaultItem];
    }
  }

  void _onStateChanged(int selState) {
    final _defaultItem = _getDefaultDropdownItem("District");

    var districts = _branchAddress.districts
        .where((d) => d.stateId == selState)
        .map((d) =>
            DropdownMenuItem(value: d.id, child: DescriptionText(d.name)))
        .toList();

    if (districts != null) {
      districts.insert(0, _defaultItem);
    } else {
      districts = [_defaultItem];
    }

    setState(() {
      _selectedState = selState;
      _districtItems = districts;
      _branchItems = [_getDefaultDropdownItem("Branch")];
      _selectedDistrict = 0;
      _selectedBranch = 0;
      _selectedBranchAddress = "";
    });
  }

  void _onDistrictChanged(int selDist) {
    final _defaultItem = _getDefaultDropdownItem("Branch");

    var branches = _branchAddress.branches
        .where((b) => b.districtId == selDist)
        .map((b) =>
            DropdownMenuItem(value: b.id, child: DescriptionText(b.name)))
        .toList();

    if (branches != null) {
      branches.insert(0, _defaultItem);
    } else {
      branches = [_defaultItem];
    }

    setState(() {
      _selectedDistrict = selDist;
      _branchItems = branches;
      _selectedBranch = 0;
      _selectedBranchAddress = "";
    });
  }

  void _onBranchChanged(int selBranch) {
    final _branch = selBranch > 0
        ? _branchAddress.branches.firstWhere((b) => b.id == selBranch)
        : null;

    setState(() {
      _selectedBranch = selBranch;
      _selectedBranchAddress = _branch == null ? "" : _branch.address;
    });
  }

  Widget _getDefaultDropdownItem(String itemText) {
    return DropdownMenuItem(
        value: 0, child: DescriptionText("Select $itemText"));
  }
}

* */
