class PaymentHistoryCoin {
  List<Data> _data;

  List<Data> get data => _data;

  PaymentHistoryCoin({List<Data> data}) {
    _data = data;
  }

  PaymentHistoryCoin.fromJson(dynamic json) {
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
  String _createdDate;
  int _coin;
  String _coinType;
  String _description;

  String get createdDate => _createdDate;
  int get coin => _coin;
  String get coinType => _coinType;
  String get description => _description;

  Data({String createdDate, int coin, String coinType, String description}) {
    _createdDate = createdDate;
    _coin = coin;
    _coinType = coinType;
    _description = description;
  }

  Data.fromJson(dynamic json) {
    _createdDate = json["createdDate"];
    _coin = json["coin"];
    _coinType = json["coinType"];
    _description = json["description"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["createdDate"] = _createdDate;
    map["coin"] = _coin;
    map["coinType"] = _coinType;
    map["description"] = _description;
    return map;
  }
}
