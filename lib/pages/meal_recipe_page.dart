import 'package:flutter/material.dart';

import '../dummy_data.dart';

class RecipePage extends StatelessWidget {
  static const routeName = "/meal-recipe";
  const RecipePage({Key? key}) : super(key: key);

  Widget buildSectionTitle(
      {required BuildContext context, required String title}) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget buildContainer(
      {required BuildContext context, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  selectMeal.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildSectionTitle(context: context, title: 'Ingredients'),
            buildContainer(
              context: context,
              child: ListView.builder(
                itemCount: selectMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      selectMeal.ingredients[index],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context: context, title: 'Steps'),
            buildContainer(
              context: context,
              child: ListView.builder(
                itemCount: selectMeal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).accentColor,
                        child: Text(
                          '#${index + 1}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      title: Text(selectMeal.steps[index]),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
