import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const id = 'category_meals_screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Category>;
    final categoryId = routeArgs['category'].id;
    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['category'].title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
