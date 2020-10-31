import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const id = 'meal_detail_screen';
  final Function toggleFavorite;
  final Function isMealFavorite;

  const MealDetailScreen(
      {Key key, @required this.toggleFavorite, @required this.isMealFavorite})
      : super(key: key);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildListItem(BuildContext context, Widget child) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 300.0,
      width: 300.0,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Meal>;
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['meal'].title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300.0,
              child: Image.network(
                routeArgs['meal'].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(0, 0, 50, 0.7),
              child: Text(
                routeArgs['meal'].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildListItem(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      routeArgs['meal'].ingredients[index],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                itemCount: routeArgs['meal'].ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Method'),
            buildListItem(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(
                        routeArgs['meal'].steps[index],
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: routeArgs['meal'].steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavorite(routeArgs['meal'].id)
            ? Icon(Icons.star_border)
            : Icon(Icons.star),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          toggleFavorite(routeArgs['meal'].id);
        },
      ),
    );
  }
}
