import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({Key key,@required this.favoriteMeals}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: favoriteMeals[index],
          );
        },
        itemCount: favoriteMeals.length,
      ),
    );
  }
}
