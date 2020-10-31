import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeItem;

  const MealItem({Key key, this.meal, this.removeItem}) : super(key: key);

  String get complexityText {
    if (meal.complexity == Complexity.Simple) {
      return 'Simple';
    } else if (meal.complexity == Complexity.Hard) {
      return 'Hard';
    } else if (meal.complexity == Complexity.Challenging) {
      return 'Challenging';
    } else {
      return 'Invalid Complexity';
    }
  }

  String get affordabilityText {
    if (meal.affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (meal.affordability == Affordability.Luxurious) {
      return 'Luxurious';
    } else if (meal.affordability == Affordability.Pricey) {
      return 'Pricey';
    } else {
      return 'Invalid Affordability';
    }
  }

  @override
  Widget build(BuildContext context) {
    void selectMeal() {
      Navigator.of(context).pushNamed(
        MealDetailScreen.id,
        arguments: {'meal': meal},
      ).then((value) => {
            if (value != null) {removeItem(value)}
          });
    }

    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4.0,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      child: Text(
                        meal.title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
