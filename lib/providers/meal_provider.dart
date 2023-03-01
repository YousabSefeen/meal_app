import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';

class MealProvider with ChangeNotifier {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> favoriteMeals = [];

  List<String> prefMealFavoriteID = [];

  List<Meal> availableMeals = dummyMeals;
  List<Category> availableCategory = [];

  void setFilters() async {
    availableMeals = dummyMeals.where((meal) {
      if (filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    /// This function is for removing empty categories from meals
    /// to which filters are applied

    List<Category> ac = [];
    for (var meal in availableMeals) {
      for (var mealCat in meal.categories) {
        for (var catID in dummyCategories) {
          if (mealCat == catID.id) {
            if (!ac.any((cat) => cat.id == catID.id)) {
              ac.add(catID);
            }
          }
        }
      }
    }
    availableCategory = ac;
    notifyListeners();

    var pref = await SharedPreferences.getInstance();

    pref.setBool('gluten', filters['gluten']!);
    pref.setBool('lactose', filters['lactose']!);
    pref.setBool('vegan', filters['vegan']!);
    pref.setBool('vegetarian', filters['vegetarian']!);
  }

  getDataPref() async {
    var pref = await SharedPreferences.getInstance();
    filters['gluten'] = pref.getBool('gluten') ?? false;
    filters['lactose'] = pref.getBool('lactose') ?? false;
    filters['vegan'] = pref.getBool('vegan') ?? false;
    filters['vegetarian'] = pref.getBool('vegetarian') ?? false;
    setFilters();
    prefMealFavoriteID = pref.getStringList('prefMealID') ?? [];

    for (var mealId in prefMealFavoriteID) {
      var existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);

      if (existingIndex < 0) {
        favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      }
    }
    List<Meal> fm = [];
    for (var favMeals in favoriteMeals) {
      for (var avaMeals in availableMeals) {
        if (favMeals.id == avaMeals.id) fm.add(favMeals);
      }
    }
    favoriteMeals = fm;
    notifyListeners();
  }

  toggleFavorite(String mealId) async {
    var pref = await SharedPreferences.getInstance();
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
      prefMealFavoriteID.remove(mealId);
    } else {
      favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      prefMealFavoriteID.add(mealId);
    }

    pref.setStringList('prefMealID', prefMealFavoriteID);
    notifyListeners();
  }

  bool iconFavoriteMeal(String mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }
}
