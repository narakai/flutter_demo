import 'package:flutter/material.dart';
import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';
import 'dimen.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      fontFamily: FontFamily.montserrat,
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: Dimens.fontSize32,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: Dimens.fontSize24,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: TextStyle(
            color: Colors.white,
            fontSize: Dimens.fontSize20,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            color: ColorName.gunPowderColor,
            fontSize: Dimens.fontSize14,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: TextStyle(
            color: ColorName.gunPowderColor,
            fontSize: Dimens.fontSize12,
            fontWeight: FontWeight.w400,
          ),
          labelMedium: TextStyle(
            color: ColorName.gunPowderColor,
            fontSize: Dimens.fontSize16,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: TextStyle(
            color: ColorName.gunPowderColor,
            fontSize: Dimens.fontSize14,
            fontWeight: FontWeight.w500,
          )),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
      ));
}
