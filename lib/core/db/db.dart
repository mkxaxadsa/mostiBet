import 'package:hive_flutter/hive_flutter.dart';

import '../models/match_model.dart';
import '../utils.dart';

class DB {
  static String boxName = 'soccerbox';
  static String keyName = 'matchesList';
  static List<MatchModel> matchesList = [];
}

Future<void> initHive() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(MatchModelAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getMatches() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    List data = box.get(DB.keyName) ?? [];
    DB.matchesList = data.cast<MatchModel>();
    logger(DB.matchesList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateMatches() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    box.put(DB.keyName, DB.matchesList);
    DB.matchesList = await box.get(DB.keyName);
  } catch (e) {
    logger(e);
  }
}
