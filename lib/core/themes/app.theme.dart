// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData appTheme() {
  return ThemeData(
    colorScheme: ColorScheme.light().copyWith(primary: HexColor("#04BF68")),
  );
}
