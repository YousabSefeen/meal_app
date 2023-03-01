import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTheme {
  static ThemeData lightMode({
    required MaterialColor primaryColor,
  }) {
    return ThemeData(
      primarySwatch: primaryColor,
      scaffoldBackgroundColor: Colors.white,

      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        toolbarHeight: 30.h,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'styleTwo',
          color: useWhiteForeground(primaryColor) ? Colors.white : Colors.black,
        ),
      ),

      cardTheme: CardTheme(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomLeft: Radius.circular(40.r),
            bottomRight: Radius.circular(40.r),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(size: 20.h),
        backgroundColor: primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(
          fontSize: 20.sp,
          color: useWhiteForeground(primaryColor) ? Colors.white : Colors.black,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp,
          color: useWhiteForeground(primaryColor) ? Colors.grey : Colors.black,
          fontWeight: FontWeight.w700,
        ),
        selectedItemColor: useWhiteForeground(primaryColor)
            ? Colors.amber
            : const Color(0xff03045e),
        unselectedItemColor: useWhiteForeground(primaryColor)
            ? Colors.white
            : const Color(0xff4a5759),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 25.sp,
            color:
                useWhiteForeground(primaryColor) ? Colors.white : Colors.black,
          )),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 80.w,
            ),
          ),
        ),
      ),
      textTheme: TextTheme(
        bodySmall: TextStyle(
          /// meal item description
          fontSize: 15.sp,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontFamily: 'styleTwo',
        ),
        bodyMedium: TextStyle(
          /// meal item name
          fontSize: 22.sp,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontFamily: 'styleOne',
        ),
        titleLarge: TextStyle(
          /// text Ingredients  and steps
          fontSize: 30.sp,
          fontFamily: 'styleOne',
          color: Colors.black,
          fontWeight: FontWeight.w800,
        ),
        titleMedium: TextStyle(
          /// details ingredients and steps
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'styleTwo',
          color: useWhiteForeground(primaryColor) ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  static ThemeData darkMode({
    required MaterialColor primaryColor,
  }) {
    return ThemeData(
      primarySwatch: primaryColor,
      canvasColor: const Color.fromARGB(255, 0, 0, 26),
      unselectedWidgetColor: Colors.white70,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        toolbarHeight: 30.h,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'styleTwo',
          color: useWhiteForeground(primaryColor) ? Colors.white : Colors.black,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 4,
        color: const Color(0xff03045e),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomLeft: Radius.circular(40.r),
            bottomRight: Radius.circular(40.r),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 25.sp,
            color:
                useWhiteForeground(primaryColor) ? Colors.white : Colors.black,
          )),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 80.w,
            ),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(size: 20.h),
        backgroundColor: primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(
          fontSize: 20.sp,
          color: useWhiteForeground(primaryColor) ? Colors.white : Colors.black,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp,
          color: useWhiteForeground(primaryColor) ? Colors.grey : Colors.black,
          fontWeight: FontWeight.w700,
        ),
        selectedItemColor:
            useWhiteForeground(primaryColor) ? Colors.amber : Colors.blue,
        unselectedItemColor:
            useWhiteForeground(primaryColor) ? Colors.white : Colors.black,
      ),
      textTheme: TextTheme(
        bodySmall: TextStyle(
          fontSize: 15.sp,
          color: Colors.grey,
          fontWeight: FontWeight.w700,
          fontFamily: 'styleTwo',
        ),
        bodyMedium: TextStyle(
          fontSize: 22.sp,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontFamily: 'styleOne',
        ),
        titleLarge: TextStyle(
          fontSize: 30.sp,
          fontFamily: 'styleOne',
          color: Colors.grey,
          fontWeight: FontWeight.w800,
        ),
        titleMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'styleTwo',
          color: useWhiteForeground(primaryColor) ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
