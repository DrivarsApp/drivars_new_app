import 'dart:convert';

class GameData {
  final String contestId, deviceId, gameId, token, userId, username;
  GameData(this.contestId, this.deviceId, this.gameId, this.token, this.userId,
      this.username);

  Map<String, dynamic> toJson() {
    return {
      jsonEncode("contestId"): jsonEncode(contestId),
      jsonEncode("deviceId"): jsonEncode(deviceId),
      jsonEncode("gameId"): jsonEncode(gameId),
      jsonEncode("token"): jsonEncode(token),
      jsonEncode("userId"): jsonEncode(userId),
      jsonEncode("username"): jsonEncode(username)
    };
  }
}
