import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function filtersFunction;
  final Map<String, bool> filtersState;
  static const id = 'filters_screen';

  const FiltersScreen(
      {Key key, @required this.filtersFunction, @required this.filtersState})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filtersState['gluten'];
    _lactoseFree = widget.filtersState['lactose'];
    _vegan = widget.filtersState['vegan'];
    _vegetarian = widget.filtersState['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.filtersFunction({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan
                });
                Navigator.of(context).pushReplacementNamed(TabsScreen.id);
              },
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    onChanged: (bool value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                    value: _glutenFree,
                    title: Text('Gluten Free'),
                  ),
                  SwitchListTile(
                    onChanged: (bool value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                    value: _lactoseFree,
                    title: Text('Lactose Free'),
                  ),
                  SwitchListTile(
                    onChanged: (bool value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                    value: _vegetarian,
                    title: Text('Vegetarian'),
                  ),
                  SwitchListTile(
                    onChanged: (bool value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                    value: _vegan,
                    title: Text('Vegan'),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
