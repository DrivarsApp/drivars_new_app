class Prize {
  List<Prizedistribution> _prizedistribution;
  bool _pollstatus;
  bool _clonetatus;
  bool _replaystatus;
  String _id;
  String _createdDate;
  String _gameID;
  String _contestName;
  int _playerJoin;
  int _entryFee;
  int _commanPercent;
  int _poolPrize;
  String _timeType;
  int _playerDistPercent;
  String _contestStartDate;
  String _contestEndDate;
  int _priority;
  int _totalprice;
  String _contestType;
  String _playType;
  String _contestStatus;
  String _titlecolor;
  int _commprice;
  int _playerSelected;
  int _v;

  List<Prizedistribution> get prizedistribution => _prizedistribution;
  bool get pollstatus => _pollstatus;
  bool get clonetatus => _clonetatus;
  bool get replaystatus => _replaystatus;
  String get id => _id;
  String get createdDate => _createdDate;
  String get gameID => _gameID;
  String get contestName => _contestName;
  int get playerJoin => _playerJoin;
  int get entryFee => _entryFee;
  int get commanPercent => _commanPercent;
  int get poolPrize => _poolPrize;
  String get timeType => _timeType;
  int get playerDistPercent => _playerDistPercent;
  String get contestStartDate => _contestStartDate;
  String get contestEndDate => _contestEndDate;
  int get priority => _priority;
  int get totalprice => _totalprice;
  String get contestType => _contestType;
  String get playType => _playType;
  String get contestStatus => _contestStatus;
  String get titlecolor => _titlecolor;
  int get commprice => _commprice;
  int get playerSelected => _playerSelected;
  int get v => _v;

  Prize(
      {List<Prizedistribution> prizedistribution,
      bool pollstatus,
      bool clonetatus,
      bool replaystatus,
      String id,
      String createdDate,
      String gameID,
      String contestName,
      int playerJoin,
      int entryFee,
      int commanPercent,
      int poolPrize,
      String timeType,
      int playerDistPercent,
      String contestStartDate,
      String contestEndDate,
      int priority,
      int totalprice,
      String contestType,
      String playType,
      String contestStatus,
      String titlecolor,
      int commprice,
      int playerSelected,
      int v}) {
    _prizedistribution = prizedistribution;
    _pollstatus = pollstatus;
    _clonetatus = clonetatus;
    _replaystatus = replaystatus;
    _id = id;
    _createdDate = createdDate;
    _gameID = gameID;
    _contestName = contestName;
    _playerJoin = playerJoin;
    _entryFee = entryFee;
    _commanPercent = commanPercent;
    _poolPrize = poolPrize;
    _timeType = timeType;
    _playerDistPercent = playerDistPercent;
    _contestStartDate = contestStartDate;
    _contestEndDate = contestEndDate;
    _priority = priority;
    _totalprice = totalprice;
    _contestType = contestType;
    _playType = playType;
    _contestStatus = contestStatus;
    _titlecolor = titlecolor;
    _commprice = commprice;
    _playerSelected = playerSelected;
    _v = v;
  }

  Prize.fromJson(dynamic json) {
    if (json["prizedistribution"] != null) {
      _prizedistribution = [];
      json["prizedistribution"].forEach((v) {
        _prizedistribution.add(Prizedistribution.fromJson(v));
      });
    }
    _pollstatus = json["pollstatus"];
    _clonetatus = json["clonetatus"];
    _replaystatus = json["replaystatus"];
    _id = json["Id"];
    _createdDate = json["createdDate"];
    _gameID = json["gameID"];
    _contestName = json["contestName"];
    _playerJoin = json["playerJoin"];
    _entryFee = json["entryFee"];
    _commanPercent = json["commanPercent"];
    _poolPrize = json["poolPrize"];
    _timeType = json["timeType"];
    _playerDistPercent = json["playerDistPercent"];
    _contestStartDate = json["contestStartDate"];
    _contestEndDate = json["contestEndDate"];
    _priority = json["priority"];
    _totalprice = json["totalprice"];
    _contestType = json["contestType"];
    _playType = json["playType"];
    _contestStatus = json["contestStatus"];
    _titlecolor = json["titlecolor"];
    _commprice = json["commprice"];
    _playerSelected = json["playerSelected"];
    _v = json["V"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_prizedistribution != null) {
      map["prizedistribution"] =
          _prizedistribution.map((v) => v.toJson()).toList();
    }
    map["pollstatus"] = _pollstatus;
    map["clonetatus"] = _clonetatus;
    map["replaystatus"] = _replaystatus;
    map["Id"] = _id;
    map["createdDate"] = _createdDate;
    map["gameID"] = _gameID;
    map["contestName"] = _contestName;
    map["playerJoin"] = _playerJoin;
    map["entryFee"] = _entryFee;
    map["commanPercent"] = _commanPercent;
    map["poolPrize"] = _poolPrize;
    map["timeType"] = _timeType;
    map["playerDistPercent"] = _playerDistPercent;
    map["contestStartDate"] = _contestStartDate;
    map["contestEndDate"] = _contestEndDate;
    map["priority"] = _priority;
    map["totalprice"] = _totalprice;
    map["contestType"] = _contestType;
    map["playType"] = _playType;
    map["contestStatus"] = _contestStatus;
    map["titlecolor"] = _titlecolor;
    map["commprice"] = _commprice;
    map["playerSelected"] = _playerSelected;
    map["V"] = _v;
    return map;
  }
}

class Prizedistribution {
  String _rank;
  int _prize;

  String get rank => _rank;
  int get prize => _prize;

  Prizedistribution({String rank, int prize}) {
    _rank = rank;
    _prize = prize;
  }

  Prizedistribution.fromJson(dynamic json) {
    _rank = json["rank"];
    _prize = json["prize"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["rank"] = _rank;
    map["prize"] = _prize;
    return map;
  }
}
