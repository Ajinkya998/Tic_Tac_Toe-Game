class Players {
  final String nickname;
  final String socketID;
  final double points;
  final String playerType;

  Players(
      {required this.nickname,
      required this.socketID,
      required this.points,
      required this.playerType});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickname': nickname,
      'socketID': socketID,
      'points': points,
      'playerType': playerType,
    };
  }

  factory Players.fromMap(Map<String, dynamic> map) {
    return Players(
      nickname: map['nickname'] ?? '',
      socketID: map['socketID'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      playerType: map['playerType'] ?? '',
    );
  }

  Players copyWith({
    String? nickname,
    String? socketID,
    double? points,
    String? playerType,
  }) {
    return Players(
      nickname: nickname ?? this.nickname,
      socketID: socketID ?? this.socketID,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }
}
