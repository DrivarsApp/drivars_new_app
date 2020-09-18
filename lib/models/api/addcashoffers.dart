/// data : [{"discount":12,"coin":500,"rs":199},{"discount":11,"coin":750,"rs":499},{"discount":10,"coin":1200,"rs":999},{"discount":15,"coin":300,"rs":99}]

class Addcashoffers {
  List<Data> _data;

  List<Data> get data => _data;

  Addcashoffers({List<Data> data}) {
    _data = data;
  }

  Addcashoffers.fromJson(dynamic json) {
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

/// discount : 12
/// coin : 500
/// rs : 199

class Data {
  int _discount;
  int _coin;
  int _rs;

  int get discount => _discount;
  int get coin => _coin;
  int get rs => _rs;

  Data({int discount, int coin, int rs}) {
    _discount = discount;
    _coin = coin;
    _rs = rs;
  }

  Data.fromJson(dynamic json) {
    _discount = json["discount"];
    _coin = json["coin"];
    _rs = json["rs"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["discount"] = _discount;
    map["coin"] = _coin;
    map["rs"] = _rs;
    return map;
  }
}
