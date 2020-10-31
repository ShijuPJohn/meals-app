import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favoriteMeals = List<Meal>();
  List<Meal> availableMeals = DUMMY_MEALS;
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    if (_favoriteMeals.any((element) => element.id == id)) {
      return true;
    }
    return false;
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      print(filterData);
      print(availableMeals);
      availableMeals = DUMMY_MEALS.where((element) {
        if (!element.isGlutenFree && _filters['gluten']) {
          return false;
        }
        if (!element.isLactoseFree && _filters['lactose']) {
          return false;
        }
        if (!element.isVegetarian && _filters['vegetarian']) {
          return false;
        }
        if (!element.isVegan && _filters['vegan']) {
          return false;
        }
        return true;
      }).toList();
      print(availableMeals);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6:
                TextStyle(fontSize: 20.0, fontFamily: 'RobotoCondensed')),
      ),
      initialRoute: TabsScreen.id,
      routes: {
        FiltersScreen.id: (context) => FiltersScreen(
              filtersState: _filters,
              filtersFunction: _setFilters,
            ),
        CategoryMealsScreen.id: (context) =>
            CategoryMealsScreen(categoryMeals: availableMeals),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        MealDetailScreen.id: (context) => MealDetailScreen(
              toggleFavorite: toggleFavorite,
              isMealFavorite: _isMealFavorite,
            ),
        TabsScreen.id: (context) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
      },
    );
  }
}
