import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';

class IngredientsMeal extends StatelessWidget {
  final String mealId;

  const IngredientsMeal({Key? key, required this.mealId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    LanguageProvider language = Provider.of<LanguageProvider>(context);
    bool isDark = Provider.of<ThemeProvider>(context).theme == ThemeMode.dark;

    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: deviceH * 0.02,
        horizontal: deviceW * 0.02,
      ),
      height: isLandScape ? deviceH * .5 : deviceH * .30,
      width: isLandScape ? deviceW * 0.4 : deviceW,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff2b2d42) : Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListView.builder(
        itemCount: language.getText('ingredients-$mealId').length,
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          color: theme.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              language.getText('ingredients-$mealId')[index],
              style: theme.textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
