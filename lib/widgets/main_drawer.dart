import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Just a random text',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.pushReplacementNamed(context, TabsScreen.id);
            },
          ),
          buildListTile(
            'Filter',
            Icons.settings,
            () {
              Navigator.pushReplacementNamed(context, FiltersScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
