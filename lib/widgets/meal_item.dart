import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../pages/meal_recipe_page.dart';

class MealItem extends StatelessWidget {
  final String id, title, imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageURL,
      required this.duration,
      required this.complexity,
      required this.affordability});

  void selectMeal(BuildContext context) {
    Navigator.popAndPushNamed(
      context,
      RecipePage.routeName,
      arguments: id,
    );
  }

  String get getComplexity {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return "Hard";
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.pricey:
        return "Pricey";
      case Affordability.luxurious:
        return "Expensive";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => selectMeal(context)),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 5,
                  right: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white70,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: 6),
                        Text('$duration min'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.extension),
                        const SizedBox(width: 6),
                        Text(getComplexity),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.currency_rupee),
                        const SizedBox(width: 6),
                        Text(getAffordability),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
