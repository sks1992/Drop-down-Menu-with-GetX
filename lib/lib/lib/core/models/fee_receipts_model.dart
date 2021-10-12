class FeeReceiptList {
  FeeReceiptList({
    required this.list,
    required this.isSuccess,
    required this.message,
  });

  late final List<FeeReceiptModel> list;
  late final bool isSuccess;
  late final String? message;

  FeeReceiptList.fromJson(Map<String, dynamic> json) {
    list = List.from(json['list'])
        .map((e) => FeeReceiptModel.fromJson(e))
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

class FeeReceiptModel {
  FeeReceiptModel({
    required this.collectionDate,
    required this.receiptNo,
    required this.receiptId,
    required this.amount,
    required this.paymentTypeId,
    required this.paymentType,
  });

  late final String collectionDate;
  late final String receiptNo;
  late final int receiptId;
  late final int amount;
  late final int paymentTypeId;
  late final String paymentType;

  FeeReceiptModel.fromJson(Map<String, dynamic> json) {
    collectionDate = json['collectionDate'];
    receiptNo = json['receiptNo'];
    receiptId = json['receiptId'];
    amount = json['amount'];
    paymentTypeId = json['paymentTypeId'];
    paymentType = json['paymentType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['collectionDate'] = collectionDate;
    _data['receiptNo'] = receiptNo;
    _data['receiptId'] = receiptId;
    _data['amount'] = amount;
    _data['paymentTypeId'] = paymentTypeId;
    _data['paymentType'] = paymentType;
    return _data;
  }
}
