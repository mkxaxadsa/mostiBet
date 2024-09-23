import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class MatchModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String team1;
  @HiveField(2)
  String team2;
  @HiveField(3)
  int score1;
  @HiveField(4)
  int score2;
  @HiveField(5)
  String date;
  @HiveField(6)
  String time;
  @HiveField(7)
  int rate1;
  @HiveField(8)
  int rate2;

  MatchModel({
    required this.id,
    required this.team1,
    required this.team2,
    required this.score1,
    required this.score2,
    required this.date,
    required this.time,
    required this.rate1,
    required this.rate2,
  });
}

class MatchModelAdapter extends TypeAdapter<MatchModel> {
  @override
  final typeId = 0;

  @override
  MatchModel read(BinaryReader reader) {
    return MatchModel(
      id: reader.read(),
      team1: reader.read(),
      team2: reader.read(),
      score1: reader.read(),
      score2: reader.read(),
      date: reader.read(),
      time: reader.read(),
      rate1: reader.read(),
      rate2: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, MatchModel obj) {
    writer.write(obj.id);
    writer.write(obj.team1);
    writer.write(obj.team2);
    writer.write(obj.score1);
    writer.write(obj.score2);
    writer.write(obj.date);
    writer.write(obj.time);
    writer.write(obj.rate1);
    writer.write(obj.rate2);
  }
}
