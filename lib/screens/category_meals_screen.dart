import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import '../models/meal.dart';
import '../providers/language_provider.dart';
import '../providers/meal_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = ' myPage_displayMealsScreen';

  const CategoryMealsScreen({super.key});

  @override
  State<CategoryMealsScreen> createState() => CategoryMealsScreenState();
}

class CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayMeal = <Meal>[];
  late String dataId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final dataReception =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    List<Meal> availableMeals =
        Provider.of<MealProvider>(context, listen: true).availableMeals;
    dataId = dataReception['id']!;

    displayMeal = availableMeals.where((element) {
      return element.categories.contains(dataId);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Provider.of<ThemeProvider>(context).primaryColor;

    LanguageProvider language = Provider.of<LanguageProvider>(context);
    return Directionality(
      textDirection: language.isEng ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            language.getText('cat-$dataId'),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25.h,
              color: useWhiteForeground(primaryColor)
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              childAspectRatio: 3 / 2,
            ),
            itemCount: displayMeal.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displayMeal[index].id,
                imageUrl: displayMeal[index].imageUrl,
                duration: displayMeal[index].duration,
                complexity: displayMeal[index].complexity,
                affordability: displayMeal[index].affordability,
              );
            },
          ),
        ),
      ),
    );
  }
}
