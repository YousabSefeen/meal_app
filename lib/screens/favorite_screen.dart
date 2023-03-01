import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../providers/language_provider.dart';
import '../providers/meal_provider.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Meal> favoriteMeals =
        Provider.of<MealProvider>(context, listen: true).favoriteMeals;

    LanguageProvider language = Provider.of<LanguageProvider>(context);

    return favoriteMeals.isEmpty
        ? Center(
            child: Text(
              language.getText('favorite_empty'),
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            itemCount: favoriteMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
              );
            },
          );
  }
}
