import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/language_provider.dart';
import '../providers/meal_provider.dart';
import '../providers/theme_provider.dart';
import '../screens/onBoarding_screen.dart';
import '../screens/theme_screen.dart';
import '../widgets/theme.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();

  Widget mainScreen = pref.getBool('watch') ?? false
      ? const TabsScreen()
      : const OnBoardingScreen();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MealProvider>(create: (ctx) => MealProvider()),
      ChangeNotifierProvider<ThemeProvider>(create: (ctx) => ThemeProvider()),
      ChangeNotifierProvider<LanguageProvider>(
          create: (ctx) => LanguageProvider()),
    ],
    child: MyApp(mainScreen),
  ));
}

class MyApp extends StatelessWidget {
  final Widget mainScreen;

  const MyApp(this.mainScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode theme = Provider.of<ThemeProvider>(context).theme;
    MaterialColor primaryColor =
        Provider.of<ThemeProvider>(context).primaryColor;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: theme,
          darkTheme: CustomTheme.darkMode(primaryColor: primaryColor),
          theme: CustomTheme.lightMode(primaryColor: primaryColor),
          home: mainScreen,
          routes: {
            TabsScreen.route: (context) => const TabsScreen(),
            CategoryMealsScreen.routeName: (context) =>
                const CategoryMealsScreen(),
            MealDetailScreen.routeName: (context) => const MealDetailScreen(),
            FiltersScreen.route: (context) => const FiltersScreen(),
            ThemeScreen.route: (context) => const ThemeScreen(),
          },
        ),
      ),
    );
  }
}
