import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../providers/language_provider.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;

  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String imageUrl;

  const MealItem({
    required this.id,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LanguageProvider language = Provider.of<LanguageProvider>(context);
    bool isLand = MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: isLand ? 15.w : 20.w,
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          MealDetailScreen.routeName,
          arguments: id,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => Card(
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.7,
                  child: Stack(
                    alignment: language.isEng
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r),
                        ),
                        child: Hero(
                          tag: id,
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/images/a2.png'),
                            image: NetworkImage(
                              imageUrl,
                            ),
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 100.w,
                          maxWidth: 250.w,
                          minHeight: 50.h,
                          maxHeight: 120.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.black54,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 15.w,
                          ),
                          child: Text(
                            language.getText('meal-$id'),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildDescMeal(
                        text: duration <= 60
                            ? ' $duration ${language.getText('min1')}'
                            : ' $duration   ${language.getText('min2')}',
                        icon: Icons.access_time,
                        context: context,
                      ),
                      buildDescMeal(
                        text: ' ${language.getText('$complexity')}',
                        icon: Icons.work,
                        context: context,
                      ),
                      buildDescMeal(
                        text: language.getText('$affordability'),
                        icon: Icons.attach_money,
                        context: context,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildDescMeal({
    required String text,
    required IconData icon,
    required BuildContext context,
  }) {
    TextStyle? bodySmall = Theme.of(context).textTheme.bodySmall;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 20.h, color: bodySmall!.color),
        SizedBox(
          width: 70,
          child: FittedBox(
            child: Text(text, style: bodySmall),
          ),
        ),
      ],
    );
  }
}
