import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/main_drawer.dart';

class ThemeScreen extends StatelessWidget {
  static const route = 'ThemeScreen_route';
  final bool fromOnBoarding;

  const ThemeScreen({super.key, this.fromOnBoarding = false});

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).theme == ThemeMode.dark;

    LanguageProvider language = Provider.of<LanguageProvider>(context);

    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Directionality(
      textDirection: language.isEng ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        drawer: fromOnBoarding ? null : const MainDrawer(),
        appBar: fromOnBoarding
            ? null
            : AppBar(
                title: Text(
                  language.getText('themes-title'),
                ),
              ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isLandScape ? 20.w : 5.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  customText(
                    context: context,
                    text: language.getText('themes-txtBody1'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: customText(
                      context: context,
                      text: language.getText('themes-txtBody2'),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  buildRadioListTile(
                    context: context,
                    title: language.getText('themes-system'),
                    themeMode: ThemeMode.system,
                  ),
                  buildRadioListTile(
                    context: context,
                    title: language.getText('themes-light'),
                    themeMode: ThemeMode.light,
                    icon: Icon(
                      Icons.sunny,
                      color: Colors.amber,
                      size: 35.h,
                    ),
                  ),
                  buildRadioListTile(
                    context: context,
                    title: language.getText('themes-dark'),
                    themeMode: ThemeMode.dark,
                    icon: Icon(
                      Icons.dark_mode_rounded,
                      color: isDark ? Colors.grey : Colors.black,
                      size: 35.h,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  onChangePrimaryCo(
                    context: context,
                    title: language.getText('themes-primary'),
                  ),
                  SizedBox(height: fromOnBoarding ? 85.h : 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text customText({
    required BuildContext context,
    required String text,
    required TextAlign textAlign,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20.sp),
      textAlign: textAlign,
    );
  }

  buildRadioListTile({
    required BuildContext context,
    required String title,
    required ThemeMode themeMode,
    Icon? icon,
  }) {
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

    return RadioListTile(
      activeColor: Colors.blue,
      title: Text(
        title,
        style:
            titleLarge!.copyWith(fontWeight: FontWeight.w900, fontSize: 23.sp),
      ),
      secondary: icon,
      value: themeMode,
      groupValue: Provider.of<ThemeProvider>(context).theme,
      onChanged: (newTheme) =>
          Provider.of<ThemeProvider>(context, listen: false)
              .onChangeTheme(newTheme),
    );
  }

  onChangePrimaryCo({
    required BuildContext context,
    required String title,
  }) {
    MaterialColor primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 23.sp,
            ),
      ),
      trailing: CircleAvatar(
        radius: 18.r,
        backgroundColor: primaryColor,
      ),
      onTap: () => showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor:
                        Provider.of<ThemeProvider>(context, listen: true)
                            .primaryColor,
                    onColorChanged: (newColor) =>
                        Provider.of<ThemeProvider>(context, listen: false)
                            .onColorChange(newColor),
                    colorPickerWidth: isLandScape ? 90.w : 300.w,
                    pickerAreaHeightPercent: 0.7,
                    displayThumbColor: true,

                    // The next line is important for deleting labels in field
                    //(RGB)..
                    labelTypes: const [],
                  ),
                ),
              )),
    );
  }
}
