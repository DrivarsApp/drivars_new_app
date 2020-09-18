class Tournament {
  String _id;
  String _createdDate;
  String _gameID;
  //ToDo confirm price/prize DataType.
  int _poolPrize;
  int _entryFee;
  String _contestStartDate;
  String _contestEndDate;
  int _playerJoin;
  String _contestName;
  String _contestType;
  String _playType;
  String _contestStatus;

  set createdDate(String value) {
    _createdDate = value;
  }

  String get createdDate => _createdDate;
  String get gameID => _gameID;
  int get poolPrize => _poolPrize;
  int get entryFee => _entryFee;
  String get contestStartDate => _contestStartDate;
  String get contestEndDate => _contestEndDate;
  int get playerJoin => _playerJoin;
  String get contestName => _contestName;
  String get contestType => _contestType;
  String get playType => _playType;
  String get contestStatus => _contestStatus;
  String get id => _id;

  Tournament(
      {String createdDate,
      String gameID,
      int poolPrize,
      int entryFee,
      String contestStartDate,
      String contestEndDate,
      int playerJoin,
      String contestName,
      String contestType,
      String playType,
      String id,
      String contestStatus}) {
    _createdDate = createdDate;
    _gameID = gameID;
    _poolPrize = poolPrize;
    _entryFee = entryFee;
    _id = id;
    _contestStartDate = contestStartDate;
    _contestEndDate = contestEndDate;
    _playerJoin = playerJoin;
    _contestName = contestName;
    _contestType = contestType;
    _playType = playType;
    _contestStatus = contestStatus;
  }

  Tournament.fromJson(dynamic json) {
    _createdDate = json["createdDate"];
    _gameID = json["gameID"];
    _poolPrize = json["poolPrize"];
    _entryFee = json["entryFee"];
    _contestStartDate = json["contestStartDate"];
    _contestEndDate = json["contestEndDate"];
    _playerJoin = json["playerJoin"];
    _contestName = json["contestName"];
    _contestType = json["contestType"];
    _playType = json["playType"];
    _contestStatus = json["contestStatus"];
    _id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["createdDate"] = _createdDate;
    map["gameID"] = _gameID;
    map["poolPrize"] = _poolPrize;
    map["entryFee"] = _entryFee;
    map["contestStartDate"] = _contestStartDate;
    map["contestEndDate"] = _contestEndDate;
    map["playerJoin"] = _playerJoin;
    map["contestName"] = _contestName;
    map["contestType"] = _contestType;
    map["playType"] = _playType;
    map["contestStatus"] = _contestStatus;
    map["_id"] = _id;
    return map;
  }

  set gameID(String value) {
    _gameID = value;
  }

  set poolPrize(int value) {
    _poolPrize = value;
  }

  set entryFee(int value) {
    _entryFee = value;
  }

  set contestStartDate(String value) {
    _contestStartDate = value;
  }

  set contestEndDate(String value) {
    _contestEndDate = value;
  }

  set playerJoin(int value) {
    _playerJoin = value;
  }

  set contestName(String value) {
    _contestName = value;
  }

  set id(String value) {
    _id = value;
  }

  set contestType(String value) {
    _contestType = value;
  }

  set playType(String value) {
    _playType = value;
  }

  set contestStatus(String value) {
    _contestStatus = value;
  }
}
