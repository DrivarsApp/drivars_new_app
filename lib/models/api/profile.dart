class Profile {
  String _fullname;
  String _username;
  String _mobileno;
  String _email;
  bool _isEmailVerfied;
  String _profilephoto;
  String _zodiac;
  String _tagline;
  String _coverphoto;
  String _status;
  String _kycVerified;
  String _dob;

  String get fullname => _fullname;
  String get username => _username;
  String get mobileno => _mobileno;
  String get email => _email;
  bool get isEmailVerfied => _isEmailVerfied;
  String get profilephoto => _profilephoto;
  String get zodiac => _zodiac;
  String get tagline => _tagline;
  String get coverphoto => _coverphoto;
  String get status => _status;
  String get kycVerified => _kycVerified;
  String get dob => _dob;

  set fullname(String value) {
    _fullname = value;
  }

  Profile(
      {String fullname,
      String username,
      String mobileno,
      String email,
      bool isEmailVerfied,
      String profilephoto,
      String zodiac,
      String tagline,
      String coverphoto,
      String status,
      String kycVerified,
      String dob}) {
    _fullname = fullname;
    _username = username;
    _mobileno = mobileno;
    _email = email;
    _isEmailVerfied = isEmailVerfied;
    _profilephoto = profilephoto;
    _zodiac = zodiac;
    _tagline = tagline;
    _coverphoto = coverphoto;
    _status = status;
    _kycVerified = kycVerified;
    _dob = dob;
  }

  Profile.fromJson(dynamic json) {
    _fullname = json["fullname"];
    _username = json["username"];
    _mobileno = json["mobileno"];
    _email = json["email"];
    _isEmailVerfied = json["isEmailVerfied"];
    _profilephoto = json["profilephoto"];
    _zodiac = json["zodiac"];
    _tagline = json["tagline"];
    _coverphoto = json["coverphoto"];
    _status = json["status"];
    _kycVerified = json["kycVerified"];
    _dob = /*Utility.convertServerDateToString(
        serverDate:*/
        json["dob"] /*, expectedFormat: 'dd/MM/yyyy')*/;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["fullname"] = _fullname;
//    map["username"] = _username;
//    map["mobileno"] = _mobileno;
    map["email"] = _email;
//    map["isEmailVerfied"] = _isEmailVerfied;
//    map["profilephoto"] = _profilephoto;
    map["zodiac"] = _zodiac;
    map["tagline"] = _tagline;
//    map["coverphoto"] = _coverphoto;
//    map["status"] = _status;
//    map["kycVerified"] = _kycVerified;
    map["dob"] = _dob;
    return map;
  }

  set username(String value) {
    _username = value;
  }

  set mobileno(String value) {
    _mobileno = value;
  }

  set email(String value) {
    _email = value;
  }

  set isEmailVerfied(bool value) {
    _isEmailVerfied = value;
  }

  set profilephoto(String value) {
    _profilephoto = value;
  }

  set zodiac(String value) {
    _zodiac = value;
  }

  set tagline(String value) {
    _tagline = value;
  }

  set coverphoto(String value) {
    _coverphoto = value;
  }

  set status(String value) {
    _status = value;
  }

  set kycVerified(String value) {
    _kycVerified = value;
  }

  set dob(String value) {
    _dob = value;
  }
}
