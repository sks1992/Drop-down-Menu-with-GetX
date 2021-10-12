class BranchAddress {
  late List<States> states;
  late List<Districts> districts;
  late List<Branches> branches;
  late bool isSuccess;
  late String message;

  BranchAddress(
      {required this.states,
      required this.districts,
      required this.branches,
      required this.isSuccess,
      required this.message});

  BranchAddress.fromJson(Map<String, dynamic> json) {
    if (json['States'] != null) {
      states = [];
      json['States'].forEach((v) {
        states.add(States.fromJson(v));
      });
    }
    if (json['Districts'] != null) {
      districts = [];
      json['Districts'].forEach((v) {
        districts.add(Districts.fromJson(v));
      });
    }
    if (json['Branches'] != null) {
      branches = [];
      json['Branches'].forEach((v) {
        branches.add(Branches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.states != null) {
      data['States'] = this.states.map((v) => v.toJson()).toList();
    }
    if (this.districts != null) {
      data['Districts'] = this.districts.map((v) => v.toJson()).toList();
    }
    if (this.branches != null) {
      data['Branches'] = this.branches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  late int id;
  late String name;

  States({required this.id, required this.name});

  States.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }
}

class Districts {
  late int stateId;
  late int id;
  late String name;

  Districts({required this.stateId, required this.id, required this.name});

  Districts.fromJson(Map<String, dynamic> json) {
    stateId = json['StateId'];
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['StateId'] = this.stateId;
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }
}

class Branches {
  late int districtId;
  late String address;
  late int id;
  late String name;

  Branches(
      {required this.districtId,
      required this.address,
      required this.id,
      required this.name});

  Branches.fromJson(Map<String, dynamic> json) {
    districtId = json['DistrictId'];
    address = json['Address'];
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['DistrictId'] = this.districtId;
    data['Address'] = this.address;
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }
}
