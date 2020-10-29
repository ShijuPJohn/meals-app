import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const String id = 'categories_screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: GridView(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (e) => CategoryItem(
                category: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
