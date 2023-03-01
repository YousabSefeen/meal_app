import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;

  final String imageUrl;

  const CategoryItem({
    super.key,
    required this.id,
    required this.imageUrl,
  });

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider lan = Provider.of<LanguageProvider>(context);
    var deviceSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.r),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/a2.png'),
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(deviceSize.width * 0.03),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              lan.getText('cat-$id'),
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
