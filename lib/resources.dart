import 'package:flutter/material.dart';

class ColorsData {
  static List<Color> themeColor = [
    const Color.fromARGB(255, 224, 232, 246),
    const Color.fromARGB(255, 91, 33, 156),
    const Color.fromARGB(255, 28, 72, 85),
    const Color.fromARGB(255, 0, 160, 142),
    const Color.fromARGB(255, 239, 195, 88),
    const Color.fromARGB(255, 255, 159, 82),
    const Color.fromARGB(255, 246, 103, 71),
  ];
  static Color primaryColor = themeColor[1];

  static List<Color> eventColors = [
    const Color.fromARGB(255, 51, 51, 102),
    const Color(0xFF89A5B3),
    const Color(0xFFC09689),
    const Color(0xFF937DB9),
    const Color(0xFF7E87B6),
    const Color(0xFFBB8194),
    const Color(0xFFBBB181),
    const Color(0xFFA581BB),
    const Color(0xFFBB818A),
  ];

  static const Map<String, String> mainData = {
    'appName': 'تطبيق الشفيع',
    'developer': 'Mohamad Haikal',
    'font': 'cairo',
  };
}
