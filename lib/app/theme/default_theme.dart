import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/theme/app_colors.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Urbanist',
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.transparent,
    isDense: true,
    hintStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 3.8.w,
      height: 2,
      color: AppColors.mutedAzure,
    ),

    border: OutlineInputBorder(
        borderSide:
            BorderSide(width: 1, color: Colors.white)), // Remove a borda padrão
    focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(width: 1, color: Colors.white)), // Remove a borda padrão

    enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(width: 1, color: Colors.white)), // Remove a borda
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(12)),
    labelStyle: TextStyle(
      height: 2,
      fontWeight: FontWeight.w600,
      fontSize: 4.2.w,
      color: AppColors.blue,
    ),
  ),
);
