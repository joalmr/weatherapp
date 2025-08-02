// constants
import "package:flutter/material.dart";
import "package:weatherapp/core/constants/colors.dart";

mixin Font implements FontWeight {
  static FontWeight get l => FontWeight.w300;
  static FontWeight get n => FontWeight.w400;
  static FontWeight get sb => FontWeight.w500;
  static FontWeight get b => FontWeight.w700;
}

class AppTextStyle extends TextStyle {
  static TextStyle get header => TextStyle(
    fontWeight: Font.b,
    fontSize: kDefaultFontSize + 14,
    color: AppColor.text,
  );
  static TextStyle get title => TextStyle(
    fontWeight: Font.sb,
    fontSize: kDefaultFontSize + 8,
    color: AppColor.text,
  );
  static TextStyle get body => TextStyle(
    fontWeight: Font.n,
    fontSize: kDefaultFontSize,
    color: AppColor.text,
  );
  static TextStyle get caption => TextStyle(
    fontWeight: Font.l,
    fontSize: kDefaultFontSize,
    color: AppColor.text,
  );
}
