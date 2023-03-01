import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../providers/meal_provider.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const route = 'FiltersScreen';
  final bool fromOnBoarding;

  const FiltersScreen({super.key, this.fromOnBoarding = false});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> currentFilters =
        Provider.of<MealProvider>(context, listen: true).filters;
    LanguageProvider language = Provider.of<LanguageProvider>(context);
    TextStyle titleLarge = Theme.of(context).textTheme.titleLarge!;

    return Directionality(
      textDirection: language.isEng ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        drawer: widget.fromOnBoarding ? null : const MainDrawer(),
        appBar: widget.fromOnBoarding
            ? null
            : AppBar(
                title: Text(language.getText('filters-title')),
              ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: widget.fromOnBoarding ? 80.h : 40.h),
                Text(
                  language.getText('filters-txtBody'),
                  style: titleLarge.copyWith(
                    fontSize: 22.sp,
                    fontFamily: 'styleTwo',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                Builder(builder: (context) {
                  return buildSwitchListTile(
                    context: context,
                    title: language.getText('filters-title1'),
                    subTitle: language.getText('filters-sub1'),
                    value: currentFilters['gluten']!,
                    function: (newVal) {
                      setState(() => currentFilters['gluten'] = newVal);
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    },
                  );
                }),
                Builder(builder: (context) {
                  return buildSwitchListTile(
                    context: context,
                    title: language.getText('filters-title2'),
                    subTitle: language.getText('filters-sub2'),
                    value: currentFilters['lactose']!,
                    function: (newVal) {
                      setState(() => currentFilters['lactose'] = newVal);
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    },
                  );
                }),
                Builder(builder: (context) {
                  return buildSwitchListTile(
                    context: context,
                    title: language.getText('filters-title3'),
                    subTitle: language.getText('filters-sub3'),
                    value: currentFilters['vegetarian']!,
                    function: (newVal) {
                      setState(() => currentFilters['vegetarian'] = newVal);
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    },
                  );
                }),
                Builder(builder: (context) {
                  return buildSwitchListTile(
                    context: context,
                    title: language.getText('filters-title4'),
                    subTitle: language.getText('filters-sub4'),
                    value: currentFilters['vegan']!,
                    function: (newVal) {
                      setState(() => currentFilters['vegan'] = newVal);
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    },
                  );
                }),
                SizedBox(height: widget.fromOnBoarding ? 80.h : 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildSwitchListTile({
    required BuildContext context,
    required String title,
    required String subTitle,
    required bool value,
    required Function(bool) function,
  }) {
    TextStyle titleLarge = Theme.of(context).textTheme.titleLarge!;

    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: SwitchListTile(
        activeColor: Theme.of(context).primaryColor,
        inactiveTrackColor: Colors.grey,
        title: Text(
          title,
          style: titleLarge.copyWith(
            fontSize: 22.sp,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14.sp,
                color: Colors.grey[700],
              ),
        ),
        value: value,
        onChanged: function,
      ),
    );
  }
}
