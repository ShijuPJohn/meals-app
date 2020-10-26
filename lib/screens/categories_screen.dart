import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static const String id = 'categories_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Categories'),
      ),
    );
  }
}
