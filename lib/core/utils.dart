import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double navBarHeight = 80;

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String timestampToString(int timestamp) {
  // timestamp to 22.06.2000
  try {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String dateToString(DateTime date) {
  // DateTime to 22.06.2000
  try {
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String timeToString(DateTime time) {
  // DateTime to 22:00
  try {
    return DateFormat('HH:mm').format(time);
  } catch (e) {
    return 'Error';
  }
}

DateTime stringToDate(String date) {
  // 22.06.2000 to DateTime
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}

void precacheImages(BuildContext context) {
  try {
    List<String> imageAssets = [
      'assets/bg.png',
      'assets/logo.png',
      'assets/puzzle1.png',
      'assets/puzzle2.png',
      'assets/puzzle3.png',
      'assets/puzzle4.png',
    ];
    for (String assets in imageAssets) {
      precacheImage(AssetImage(assets), context);
    }
  } catch (e) {
    logger(e);
  }
}

void precacheImages2(BuildContext context) {
  try {
    List<String> imageAssets = [
      'assets/puzzle/cup1.png',
      'assets/puzzle/cup2.png',
      'assets/puzzle/cup3.png',
      'assets/puzzle/cup4.png',
      'assets/puzzle/cup5.png',
      'assets/puzzle/cup6.png',
      'assets/puzzle/cup7.png',
      'assets/puzzle/cup8.png',
      'assets/puzzle/cup9.png',
      'assets/puzzle/boots1.png',
      'assets/puzzle/boots2.png',
      'assets/puzzle/boots3.png',
      'assets/puzzle/boots4.png',
      'assets/puzzle/boots5.png',
      'assets/puzzle/boots6.png',
      'assets/puzzle/boots7.png',
      'assets/puzzle/boots8.png',
      'assets/puzzle/boots9.png',
      'assets/puzzle/goalkeeper1.png',
      'assets/puzzle/goalkeeper2.png',
      'assets/puzzle/goalkeeper3.png',
      'assets/puzzle/goalkeeper4.png',
      'assets/puzzle/goalkeeper5.png',
      'assets/puzzle/goalkeeper6.png',
      'assets/puzzle/goalkeeper7.png',
      'assets/puzzle/goalkeeper8.png',
      'assets/puzzle/goalkeeper9.png',
      'assets/puzzle/helmet1.png',
      'assets/puzzle/helmet2.png',
      'assets/puzzle/helmet3.png',
      'assets/puzzle/helmet4.png',
      'assets/puzzle/helmet5.png',
      'assets/puzzle/helmet6.png',
      'assets/puzzle/helmet7.png',
      'assets/puzzle/helmet8.png',
      'assets/puzzle/helmet9.png',
    ];
    for (String assets in imageAssets) {
      precacheImage(AssetImage(assets), context);
    }
  } catch (e) {
    logger(e);
  }
}
