class Dashboard {
  Feature _feature;
  List<Slider> _slider;
  List<Game> _game;

  Feature get feature => _feature;
  List<Slider> get slider => _slider;
  List<Game> get game => _game;

  Dashboard({Feature feature, List<Slider> slider, List<Game> game}) {
    _feature = feature;
    _slider = slider;
    _game = game;
  }

  Dashboard.fromJson(dynamic json) {
    _feature =
        json["feature"] != null ? Feature.fromJson(json["feature"]) : null;
    if (json["slider"] != null) {
      _slider = [];
      json["slider"].forEach((v) {
        _slider.add(Slider.fromJson(v));
      });
    }
    if (json["game"] != null) {
      _game = [];
      json["game"].forEach((v) {
        _game.add(Game.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_feature != null) {
      map["feature"] = _feature.toJson();
    }
    if (_slider != null) {
      map["slider"] = _slider.map((v) => v.toJson()).toList();
    }
    if (_game != null) {
      map["game"] = _game.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Game {
  List<Subgame> _subgame;
  String _gameName;
  String _gameDescription;
  String _gameImage;
  String _gameVideo;
  String _gameId;

  List<Subgame> get subgame => _subgame;
  String get gameName => _gameName;
  String get gameDescription => _gameDescription;
  String get gameImage => _gameImage;
  String get gameVideo => _gameVideo;
  String get gameId => _gameId;

  Game(
      {List<Subgame> subgame,
      String gameName,
      String gameDescription,
      String gameImage,
      String gameId,
      String gameVideo}) {
    _subgame = subgame;
    _gameName = gameName;
    _gameDescription = gameDescription;
    _gameImage = gameImage;
    _gameVideo = gameVideo;
    _gameId = gameId;
  }

  Game.fromJson(dynamic json) {
    if (json["subgame"] != null) {
      _subgame = [];
      json["subgame"].forEach((v) {
        _subgame.add(Subgame.fromJson(v));
      });
    }
    _gameName = json["gameName"];
    _gameDescription = json["gameDescription"];
    _gameImage = json["gameImage"];
    _gameVideo = json["gameVideo"];
    _gameId = json["_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_subgame != null) {
      map["subgame"] = _subgame.map((v) => v.toJson()).toList();
    }
    map["gameName"] = _gameName;
    map["gameDescription"] = _gameDescription;
    map["gameImage"] = _gameImage;
    map["gameVideo"] = _gameVideo;
    map["_id"] = _gameId;
    return map;
  }
}

class Subgame {
  String _gameName;
  String _gameDescription;
  String _gameImage;
  String _gameVideo;
  String _gameId;

  String get gameName => _gameName;
  String get gameDescription => _gameDescription;
  String get gameImage => _gameImage;
  String get gameVideo => _gameVideo;
  String get gameId => _gameId;

  Subgame(
      {String gameName,
      String gameDescription,
      String gameImage,
      String gameId,
      String gameVideo}) {
    _gameName = gameName;
    _gameDescription = gameDescription;
    _gameImage = gameImage;
    _gameVideo = gameVideo;
    _gameId = gameId;
  }

  Subgame.fromJson(dynamic json) {
    _gameId = json["_id"];
    _gameName = json["gameName"];
    _gameDescription = json["gameDescription"];
    _gameImage = json["gameImage"];
    _gameVideo = json["gameVideo"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["gameName"] = _gameName;
    map["gameDescription"] = _gameDescription;
    map["gameImage"] = _gameImage;
    map["gameVideo"] = _gameVideo;
    map["_id"] = _gameId;
    return map;
  }
}

class Slider {
  String _sliderName;
  String _sliderImage;
  String _gameId;

  String get sliderImage => _sliderImage;
  String get gameId => _gameId;
  String get sliderName => _sliderName;

  Slider({String sliderImage, String gameId, String sliderName}) {
    _sliderImage = sliderImage;
    _gameId = gameId;
    _sliderName = sliderName;
  }

  Slider.fromJson(dynamic json) {
    _sliderImage = json["sliderImage"];
    _gameId = json["_id"];
    _sliderName = json["sliderName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sliderImage"] = _sliderImage;
    map["_id"] = _gameId;
    map["sliderName"] = _sliderName;
    return map;
  }
}

class Feature {
  String _gameName;
  String _gameDescription;
  String _gameImage;
  String _gameVideo;
  String _gameId;

  String get gameName => _gameName;
  String get gameDescription => _gameDescription;
  String get gameImage => _gameImage;
  String get gameVideo => _gameVideo;
  String get gameId => _gameId;

  Feature(
      {String gameName,
      String gameDescription,
      String gameImage,
      String gameId,
      String gameVideo}) {
    _gameName = gameName;
    _gameDescription = gameDescription;
    _gameImage = gameImage;
    _gameVideo = gameVideo;
    _gameId = gameId;
  }

  Feature.fromJson(dynamic json) {
    _gameName = json["gameName"];
    _gameDescription = json["gameDescription"];
    _gameImage = json["gameImage"];
    _gameVideo = json["gameVideo"];
    _gameId = json["_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["gameName"] = _gameName;
    map["gameDescription"] = _gameDescription;
    map["gameImage"] = _gameImage;
    map["gameVideo"] = _gameVideo;
    map['_id'] = _gameId;
    return map;
  }
}
