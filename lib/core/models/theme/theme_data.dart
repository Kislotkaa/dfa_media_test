import 'package:dfa_media_flutter/core/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

import 'package:dfa_media_flutter/core/models/theme/colors.dart';

class AppThemeData {
  static final ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AppDarkColors.scaffold,
      iconTheme: IconThemeData(color: AppDarkColors.text),
      surfaceTintColor: AppStaticColors.black,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppStaticColors.black,
      linearTrackColor: AppStaticColors.black,
      color: AppStaticColors.white,
    ),
    cardColor: AppDarkColors.card,
    primaryColor: AppStaticColors.primary,
    brightness: Brightness.dark,
    unselectedWidgetColor: AppDarkColors.text,
    iconTheme: const IconThemeData(color: AppDarkColors.text),
    hintColor: AppDarkColors.text,
    scaffoldBackgroundColor: AppDarkColors.scaffold,
    dividerColor: AppDarkColors.gray,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppDarkColors.background,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontFamily: FontFamily.stolzl,
        color: AppDarkColors.text,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.25,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.stolzl,
        color: AppDarkColors.text,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontFamily.stolzl,
        color: AppDarkColors.text,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.4,
      ),
    ),
  );

  static final ThemeData light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AppLightColors.scaffold,
      iconTheme: IconThemeData(
        color: AppLightColors.text,
      ),
      surfaceTintColor: AppStaticColors.white,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppStaticColors.white,
      linearTrackColor: AppStaticColors.white,
      color: AppStaticColors.black,
    ),
    cardColor: AppLightColors.card,
    primaryColor: AppStaticColors.primary,
    brightness: Brightness.light,
    unselectedWidgetColor: AppLightColors.text,
    iconTheme: const IconThemeData(color: AppLightColors.text),
    scaffoldBackgroundColor: AppLightColors.scaffold,
    hintColor: AppLightColors.text,
    dividerColor: AppLightColors.gray,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppLightColors.background,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontFamily: FontFamily.stolzl,
        color: AppLightColors.text,
        fontSize: 16,
        height: 1.25,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.stolzl,
        color: AppLightColors.text,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontFamily.stolzl,
        color: AppLightColors.text,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.4,
      ),
    ),
  );
}
