import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/screens/theme_screen.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/language_provider.dart';

import 'filters_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    LanguageProvider language = Provider.of<LanguageProvider>(context);
    TextStyle? bodyMedium = Theme.of(context).textTheme.bodyMedium!;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: ExactAssetImage('assets/images/image.jpg'),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 15.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        language.getText('drawer-title'),
                        style: bodyMedium.copyWith(fontSize: 30.sp),
                      ),
                    ),
                    // The next programming is contain the switch languages

                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      width: isLandScape ? 200.w : 330.w,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Text(
                            language.getText('choose-lan'),
                            style: bodyMedium.copyWith(fontSize: 25.sp),
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                language.getText('switch-arabic'),
                                style: bodyMedium.copyWith(fontSize: 25.sp),
                              ),
                              Switch(
                                value: language.isEng,
                                onChanged: (newLan) {
                                  Provider.of<LanguageProvider>(context,
                                          listen: false)
                                      .onChangeLanguage(newLan);
                                },
                              ),
                              Text(
                                language.getText('switch-english'),
                                style: bodyMedium.copyWith(fontSize: 25.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (isLandScape) SizedBox(height: 20.h)
                  ],
                ),
              ),
              const ThemeScreen(fromOnBoarding: true),
              const FiltersScreen(fromOnBoarding: true),
            ],
            onPageChanged: (newPage) => setState(() {
              _currentPage = newPage;
            }),
          ),
          Builder(
              builder: (ctx) => Align(
                    alignment: const Alignment(0, 0.85),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: ElevatedButton(
                        child: Text(
                          language.getText('start'),
                        ),
                        onPressed: () async {
                          Navigator.of(ctx)
                              .pushReplacementNamed(TabsScreen.route);

                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.setBool('watch', true);
                        },
                      ),
                    ),
                  )),
          Indicator(_currentPage),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int index;

  const Indicator(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(context, 0),
          buildContainer(context, 1),
          buildContainer(context, 2),
        ],
      ),
    );
  }

  buildContainer(BuildContext ctx, int i) {
    return index == i
        ? Icon(
            Icons.star_border,
            size: 23.h,
            color: Theme.of(ctx).primaryColor,
          )
        : Container(
            margin: const EdgeInsets.all(4),
            height: 15.h,
            width: 15.h,
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          );
  }
}
