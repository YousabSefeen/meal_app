import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';

class MealSteps extends StatelessWidget {
  final String mealId;

  const MealSteps({Key? key, required this.mealId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    bool isDark = Provider.of<ThemeProvider>(context).theme == ThemeMode.dark;
    LanguageProvider language = Provider.of<LanguageProvider>(context);
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
        itemCount: language.getText('steps-$mealId').length,
        padding: const EdgeInsets.all(0),
        itemBuilder: (ctx, index) => Column(
          children: [
            ListTile(
              title: Text(
                language.getText('steps-$mealId')[index],
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight:FontWeight.w700 ,
                  fontFamily: 'styleOne',
                  color: isDark ? const Color(0xffa3b18a) : Colors.black,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor,
                child: Text(
                  '#${index + 1}',
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
            Divider(color: isDark ? Colors.white : Colors.black),
          ],
        ),
      ),
    );
  }
}
