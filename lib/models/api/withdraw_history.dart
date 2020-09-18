class WithdrawHistory {
  List<Data> _data;

  List<Data> get data => _data;

  WithdrawHistory({List<Data> data}) {
    _data = data;
  }

  WithdrawHistory.fromJson(dynamic json) {
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
  int _amount;
  String _type;
  String _description;
  String _status;

  int get amount => _amount;
  String get type => _type;
  String get description => _description;
  String get status => _status;

  Data({int amount, String type, String description, String status}) {
    _amount = amount;
    _type = type;
    _description = description;
    _status = status;
  }

  Data.fromJson(dynamic json) {
    _amount = json["amount"];
    _type = json["Type"];
    _description = json["description"];
    _status = json["status"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["amount"] = _amount;
    map["Type"] = _type;
    map["description"] = _description;
    map["status"] = _status;
    return map;
  }
}
