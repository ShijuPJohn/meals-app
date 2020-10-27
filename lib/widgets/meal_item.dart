import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({Key key, this.meal}) : super(key: key);

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
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
                  child: Image.network(meal.imageUrl,height: 200, width: double.infinity,fit:BoxFit.cover ,),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    child: Text(meal.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Colors.orange.shade500
                    ),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
