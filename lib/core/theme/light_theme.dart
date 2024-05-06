import 'package:bookly/constans.dart';
import 'package:flutter/material.dart';

ThemeData LightTheme() => ThemeData.light().copyWith(
    primaryIconTheme: const IconThemeData(color: Colors.black),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff9D9D9D),
      indicatorColor: Color(0xffD45555),
      labelColor: Colors.black,
    ),
    disabledColor: Colors.black26,
    scaffoldBackgroundColor: kLightPrimreyColor,
    textTheme: const TextTheme(
        bodySmall: TextStyle(color: Color(0xff9D9D9D)),
        bodyMedium: TextStyle(color: Color(0xff19191B)),
        labelMedium: TextStyle(color: Color(0xff19191B))));
