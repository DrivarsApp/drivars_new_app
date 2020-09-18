/// data : [{"accountname":"123456","accountno":123456,"branchname":"begur","ifsccode":"ICIC001","bankname":"sbi"},{"accountname":"sumit bhayani","accountno":89287567132132,"branchname":"OP road","ifsccode":"ICIC001","bankname":"ICICI BANK"},{"accountname":"123456789","accountno":123456789,"branchname":"dasarahalli ","ifsccode":"ICIC001","bankname":"test"}]

class Accountdetails {
  List<Data> _data;

  List<Data> get data => _data;

  Accountdetails({List<Data> data}) {
    _data = data;
  }

  Accountdetails.fromJson(dynamic json) {
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

/// accountname : "123456"
/// accountno : 123456
/// branchname : "begur"
/// ifsccode : "ICIC001"
/// bankname : "sbi"

class Data {
  String _accountname;
  int _accountno;
  String _branchname;
  String _ifsccode;
  String _bankname;
  String _bankid;

  String get accountname => _accountname;
  int get accountno => _accountno;
  String get branchname => _branchname;
  String get ifsccode => _ifsccode;
  String get bankname => _bankname;
  String get bankid => _bankid;

  Data(
      {String accountname,
      int accountno,
      String branchname,
      String ifsccode,
      String bankId,
      String bankname}) {
    _accountname = accountname;
    _accountno = accountno;
    _branchname = branchname;
    _ifsccode = ifsccode;
    _bankname = bankname;
    _bankid = bankId;
  }

  Data.fromJson(dynamic json) {
    _accountname = json["accountname"];
    _accountno = json["accountno"];
    _branchname = json["branchname"];
    _ifsccode = json["ifsccode"];
    _bankname = json["bankname"];
    _bankid = json["_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["accountname"] = _accountname;
    map["accountno"] = _accountno;
    map["branchname"] = _branchname;
    map["ifsccode"] = _ifsccode;
    map["bankname"] = _bankname;
    map["_id"] = _bankid;
    return map;
  }
}
