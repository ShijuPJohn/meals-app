import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryMealsScreen.id,
          arguments: {'category': category},
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child:
            Text(category.title, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [category.color.withOpacity(0.4), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(6.0)),
      ),
    );
  }
}
