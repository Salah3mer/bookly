import 'package:bookly/constans.dart';
import 'package:flutter/material.dart';

ThemeData DarkTheme() => ThemeData.dark().copyWith(
      scaffoldBackgroundColor: kDarkPrimreyColor,
      highlightColor: const Color(0xffFFFFFF).withOpacity(.2),
      textTheme: const TextTheme(
          bodySmall: TextStyle(color: Color(0xff9D9D9D)),
          bodyMedium: TextStyle(color: Color(0xffFFFFFF)),
          labelMedium: TextStyle(color: Color(0xffD45555))),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Color(0xff9D9D9D),
        indicatorColor: Color(0xffD45555),
        labelColor: Colors.white,
      ),
    );
