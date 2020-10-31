import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> categoryMeals;
  static const id = 'category_meals_screen';

  const CategoryMealsScreen({Key key,@required this.categoryMeals}) : super(key: key);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayedMeals;
  String title;
  var loadedInitData = false;

  void removeItem(String id) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Category>;
      final categoryId = routeArgs['category'].id;
      displayedMeals = widget.categoryMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      title = routeArgs['category'].title;
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: displayedMeals[index],
            removeItem: removeItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
