class PaymentHistoryCash {
  List<Data> _data;

  List<Data> get data => _data;

  PaymentHistoryCash({int status, String message, List<Data> data}) {
    _data = data;
  }

  PaymentHistoryCash.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  String _currencyType;
  bool _paymentCompleted;
  String _paymentDate;
  int _amount;
  String _paymentMode;
  String _txMsg;
  String _txStatus;
  String _txTime;

  String get currencyType => _currencyType;
  bool get paymentCompleted => _paymentCompleted;
  String get paymentDate => _paymentDate;
  int get amount => _amount;
  String get paymentMode => _paymentMode;
  String get txMsg => _txMsg;
  String get txStatus => _txStatus;
  String get txTime => _txTime;

  Data(
      {String currencyType,
      bool paymentCompleted,
      String paymentDate,
      int amount,
      String paymentMode,
      String txMsg,
      String txStatus,
      String txTime}) {
    _currencyType = currencyType;
    _paymentCompleted = paymentCompleted;
    _paymentDate = paymentDate;
    _amount = amount;
    _paymentMode = paymentMode;
    _txMsg = txMsg;
    _txStatus = txStatus;
    _txTime = txTime;
  }

  Data.fromJson(dynamic json) {
    _currencyType = json["currencyType"];
    _paymentCompleted = json["paymentCompleted"];
    _paymentDate = json["PaymentDate"];
    _amount = json["amount"];
    _paymentMode = json["paymentMode"];
    _txMsg = json["txMsg"];
    _txStatus = json["txStatus"];
    _txTime = json["txTime"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["currencyType"] = _currencyType;
    map["paymentCompleted"] = _paymentCompleted;
    map["PaymentDate"] = _paymentDate;
    map["amount"] = _amount;
    map["paymentMode"] = _paymentMode;
    map["txMsg"] = _txMsg;
    map["txStatus"] = _txStatus;
    map["txTime"] = _txTime;
    return map;
  }
}
