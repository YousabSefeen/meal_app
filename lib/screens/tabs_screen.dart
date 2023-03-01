import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../providers/meal_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  static const route = 'TabsScreen_route';

  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _indexPage = 0;

  void _counter(int index) {
    setState(() => _indexPage = index);
  }

  late List<Map<String, dynamic>> _pages;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var lan = Provider.of<LanguageProvider>(context);
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': lan.getText('categories-title'),
      },
      {
        'page': const FavoriteScreen(),
        'title': lan.getText('favorite-title'),
      }
    ];

    Provider.of<MealProvider>(context, listen: false).getDataPref();
    Provider.of<ThemeProvider>(context, listen: false).getThemeAndColorPref();
    Provider.of<LanguageProvider>(context, listen: false).getLanguagePref();
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor primaryColor =
        Provider.of<ThemeProvider>(context).primaryColor;
    LanguageProvider language = Provider.of<LanguageProvider>(context);
    return Directionality(
      textDirection: language.isEng ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu_outlined,
                size: 25.h,
                color: useWhiteForeground(primaryColor)
                    ? Colors.white
                    : Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
          title: Text(_pages[_indexPage]['title']),
        ),
        body: SafeArea(
          child: _pages[_indexPage]['page'],
        ),
        bottomNavigationBar: Container(
          margin:
              EdgeInsets.only(bottom: 13.h, top: 0, left: 33.w, right: 33.w),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
          child: BottomNavigationBar(
            onTap: _counter,
            currentIndex: _indexPage,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.category),
                label: language.getText('categories-title'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: language.getText('favorite-title'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
