import 'dart:ui';

import 'package:flutter/material.dart';

Color firstColor = Color(0xFF7A36DC);
Color secondColor = Color(0xFF7A36DC).withOpacity(0.5);
Color thirdColor = Color(0xFF7A36DC).withOpacity(0.2);

Color greyColor = Colors.grey[800];
Color darkGreyColor = Color(0xFFB8B2CB);

final appTheme = ThemeData(
  primarySwatch: Colors.purple,
  backgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: secondColor
  ),
);
