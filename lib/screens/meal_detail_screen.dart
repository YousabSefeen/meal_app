import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/models/meal.dart';

import 'package:provider/provider.dart';
import '../dummy_data.dart';
import '../providers/language_provider.dart';
import '../providers/meal_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/meal_ingredients.dart';
import '../widgets/meal_steps.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail_screen';

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor primaryColor =
        Provider.of<ThemeProvider>(context).primaryColor;

    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final Meal detail =
        dummyMeals.firstWhere((element) => element.id == mealId);

    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    LanguageProvider language = Provider.of<LanguageProvider>(context);
    bool isFavorite = Provider.of<MealProvider>(context, listen: true)
        .iconFavoriteMeal(mealId);

    return Directionality(
      textDirection: language.isEng ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: buildLeadingTabBar(language, context),
              expandedHeight: isLandScape ? 230.h : 250.h,
              pinned: false,
              flexibleSpace: customFlexibleSpaceBar(
                language,
                mealId,
                context,
                detail,
                isLandScape,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  if (!isLandScape)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 25.w,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          buildTextInformation(
                            context,
                            language.getText('ingredients'),
                          ),
                          SizedBox(height: 10.h),
                          IngredientsMeal(mealId: mealId),
                          SizedBox(height: 20.h),
                          buildTextInformation(
                            context,
                            language.getText('steps'),
                          ),
                          SizedBox(height: 10.h),
                          MealSteps(mealId: mealId),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                  if (isLandScape)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 10.h),
                              buildTextInformation(
                                context,
                                language.getText('ingredients'),
                              ),
                              SizedBox(height: 15.h),
                              IngredientsMeal(mealId: mealId),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 10.h),
                              buildTextInformation(
                                context,
                                language.getText('steps'),
                              ),
                              SizedBox(height: 15.h),
                              MealSteps(mealId: mealId),
                            ],
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: () => Provider.of<MealProvider>(context, listen: false)
              .toggleFavorite(mealId),
          label: Text(language.getText('favorite-title')),
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color:
                useWhiteForeground(primaryColor) ? Colors.amber : Colors.black,
            size: 30.h,
          ),
        ),
      ),
    );
  }

  Padding buildLeadingTabBar(LanguageProvider language, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: language.isEng ? 15.w : 0,
        right: language.isEng ? 0 : 15.w,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.black54,
        radius: 15.r,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.h,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  FlexibleSpaceBar customFlexibleSpaceBar(LanguageProvider language,
      String mealId, BuildContext context, Meal detail, bool isLandScape) {
    return FlexibleSpaceBar(
      title: Align(
        alignment:
            language.isEng ? Alignment.bottomLeft : Alignment.bottomRight,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: language.isEng ? 10.w : 0,
              right: language.isEng ? 0 : 10.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.black54,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
              horizontal: 7.w,
            ),
            constraints: BoxConstraints(
              maxHeight: 80.h,
              maxWidth: 200.w,
            ),
            child: Text(
              language.getText('meal-$mealId'),
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'styleOne',
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
      background: Hero(
        tag: mealId,
        child: InteractiveViewer(
          child: FadeInImage(
            placeholder: const AssetImage('assets/images/a2.png'),
            image: NetworkImage(
              detail.imageUrl,
            ),
            fit: BoxFit.cover,
            width: double.infinity,
            height: isLandScape ? 230.h : 300.h,
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  Text buildTextInformation(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
