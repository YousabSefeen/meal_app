import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/theme_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider language = Provider.of<LanguageProvider>(context);
    Color primaryColor = Theme.of(context).primaryColor;

    bool isDark = Provider.of<ThemeProvider>(context).theme == ThemeMode.dark;
    TextStyle? titleMedium =
        Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 23.sp);
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Directionality(
      textDirection: language.isEng ? TextDirection.ltr : TextDirection.rtl,
      child: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            Container(
              height: isLandScape ? 0 : 150.h,
              width: double.infinity,
              color: isDark ? Colors.black : Colors.amber,
              child: Center(
                child: Text(
                  language.getText('drawer-title'),
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontFamily: 'styleOne',
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            buildListTile(
              context,
              Icons.restaurant,
              language.getText('drawer-d1'),
              TabsScreen.route,
            ),
            buildListTile(
              context,
              Icons.settings,
              language.getText('drawer-d2'),
              FiltersScreen.route,
            ),
            buildListTile(
              context,
              Icons.color_lens,
              language.getText('drawer-d3'),
              ThemeScreen.route,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    language.getText('switch-arabic'),
                    style: titleMedium,
                  ),
                  Switch(
                    activeColor: useWhiteForeground(primaryColor)
                        ? Colors.amber
                        : Colors.black,
                    inactiveTrackColor: useWhiteForeground(primaryColor)
                        ? Colors.grey
                        : Colors.black54,
                    value: language.isEng,
                    onChanged: (newLan) {
                      Provider.of<LanguageProvider>(context, listen: false)
                          .onChangeLanguage(newLan);
                    },
                  ),
                  Text(
                    language.getText('switch-english'),
                    style: titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildListTile(
      BuildContext context, IconData icon, String text, String route) {
    TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
    return Column(
      children: [
        SizedBox(height: 20.h),
        ListTile(
          onTap: () => Navigator.pushReplacementNamed(context, route),
          leading: Icon(icon, size: 25.h, color: titleMedium!.color),
          title: Text(text, style: titleMedium.copyWith(fontSize: 22.sp)),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 28.h,
            color: titleMedium.color,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
