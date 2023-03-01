import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/meal_provider.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GridView(
      padding: EdgeInsets.symmetric(
        vertical: deviceSize.height * 0.02,
        horizontal: deviceSize.width * 0.02,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: [
        ...Provider.of<MealProvider>(context).availableCategory.map(
              (catData) => CategoryItem(
                id: catData.id,
                imageUrl: catData.imageUrl,
              ),
            ),
      ],
    );
  }
}
