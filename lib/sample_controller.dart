import 'package:get/get.dart';

import 'barnch_address_model.dart';
import 'branch_address_api.dart';
import 'dropdown_model.dart';

class SampleController extends GetxController {
  BranchAddressApi api = BranchAddressApi();

  BranchAddress branchAddress = BranchAddress(
      branches: [], districts: [], states: [], message: '', isSuccess: false);

  DropDownModel dropDownModel = DropDownModel(id: 0, name: '');

  final _states = Rx<List<DropDownModel>>([]);
  final _districts = Rx<List<DropDownModel>>([]);
  final _branches = Rx<List<DropDownModel>?>(null);

  List<DropDownModel> get states => _states.value;

  List<DropDownModel> get districts => _districts.value;

  List<DropDownModel>? get branches => _branches.value;

  var stateDropDownValue = "0".obs;
  var districtDropDownValue = "0".obs;
  var branchDropDownValue = "0".obs;

  RxString selectedBranchAddress = "".obs;

  void _setData() {}

  void setDistricts(String selState) {
    _districts.value.clear();
    _branches.value = null;

    _districts.value = branchAddress.districts
        .where((e) => e.stateId.toString() == selState)
        .map((e) => DropDownModel(id: e.id, name: e.name))
        .toList();
    _districts.value.insert(0, DropDownModel(id: 0, name: "Select"));

    districtDropDownValue.value = "0";
  }

  void setBranches(String selDistrict) {
    _branches.value = null;
    selectedBranchAddress.value = '';

    _branches.value = branchAddress.branches
        .where((e) => e.districtId.toString() == selDistrict)
        .map((e) => DropDownModel(id: e.id, name: e.name))
        .toList();

    _branches.value?.insert(0, DropDownModel(id: 0, name: "Select"));

    branchDropDownValue.value = "0";
  }

  void setBranchAddress(String selBranch) {
    final _branch = selBranch.isNotEmpty
        ? branchAddress.branches.firstWhere((b) => b.id.toString() == selBranch)
        : null;

    selectedBranchAddress.value = _branch == null ? "" : _branch.address;
  }

  @override
  void onInit() {
    getBranchAddress();
    _setData();
    super.onInit();
  }

  Future<void> getBranchAddress() async {
    branchAddress = await api.getBranchAddress();
    _states.value = branchAddress.states
        .map((e) => DropDownModel(id: e.id, name: e.name))
        .toList();
    _states.value.insert(0, DropDownModel(id: 0, name: "Select"));
  }
}
