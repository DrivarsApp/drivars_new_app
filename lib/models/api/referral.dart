class Referral {
  String _referralCode;
  List<English> _english;
  List<Hindi> _hindi;

  String get referralCode => _referralCode;
  List<English> get english => _english;
  List<Hindi> get hindi => _hindi;

  Referral({String referralCode, List<English> english, List<Hindi> hindi}) {
    _referralCode = referralCode;
    _english = english;
    _hindi = hindi;
  }

  Referral.fromJson(dynamic json) {
    _referralCode = json["referral_code"];
    if (json["english"] != null) {
      _english = [];
      json["english"].forEach((v) {
        _english.add(English.fromJson(v));
      });
    }
    if (json["hindi"] != null) {
      _hindi = [];
      json["hindi"].forEach((v) {
        _hindi.add(Hindi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["referralCode"] = _referralCode;
    if (_english != null) {
      map["english"] = _english.map((v) => v.toJson()).toList();
    }
    if (_hindi != null) {
      map["hindi"] = _hindi.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Hindi {
  String _referralTitle;
  String _referralDesc;

  String get referralTitle => _referralTitle;
  String get referralDesc => _referralDesc;

  Hindi({String referralTitle, String referralDesc}) {
    _referralTitle = referralTitle;
    _referralDesc = referralDesc;
  }

  Hindi.fromJson(dynamic json) {
    _referralTitle = json["referralTitle"];
    _referralDesc = json["referraldesc"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["referralTitle"] = _referralTitle;
    map["referraldesc"] = _referralDesc;
    return map;
  }
}

class English {
  String _referralTitle;
  String _referralDesc;

  String get referralTitle => _referralTitle;
  String get referralDesc => _referralDesc;

  English({String referralTitle, String referralDesc}) {
    _referralTitle = referralTitle;
    _referralDesc = referralDesc;
  }

  English.fromJson(dynamic json) {
    _referralTitle = json["referralTitle"];
    _referralDesc = json["referraldesc"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["referralTitle"] = _referralTitle;
    map["referraldesc"] = _referralDesc;
    return map;
  }
}
