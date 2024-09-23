import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: Fonts.regular,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.border,
    selectionColor: AppColors.border,
    selectionHandleColor: AppColors.border,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.border,
  ),
  dialogTheme: const DialogTheme(
    // insetPadding: EdgeInsets.symmetric(horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  ),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: Fonts.regular,
      color: AppColors.black,
    ),
    dateTimePickerTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 24,
      fontFamily: Fonts.medium,
    ),
  ),
);
