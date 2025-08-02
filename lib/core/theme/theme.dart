import "package:flutter/material.dart";
import "package:weatherapp/core/constants/constants.dart";

ThemeData themeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColor.background,
  primaryColor: AppColor.primary,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
);
