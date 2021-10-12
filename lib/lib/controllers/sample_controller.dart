import 'package:get/get.dart';
import 'package:sample_login/models/dropdown_model.dart';

class SampleController extends GetxController {
  final _states = Rx<List<DropDownModel>>([]);
  final _districts = Rx<List<DropDownModel>>([]);

  List<DropDownModel> get states => _states.value;

  List<DropDownModel> get districts => _districts.value;

  var stateDropDownValue = "0".obs;
  var districtDropDownValue = "0".obs;

  void _setData() {
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

  @override
  void onInit() {
    _setData();
    super.onInit();
  }
}
