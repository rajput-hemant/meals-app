import 'package:flutter/material.dart';

import '../dummy_data.dart';

class RecipePage extends StatelessWidget {
  static const routeName = "/meal-recipe";
  const RecipePage({Key? key}) : super(key: key);

  Widget buildSectionTitle({
    required String title,
    required ThemeData theme,
  }) {
    return Text(
      title,
      style: theme.textTheme.headline6,
    );
  }

  Widget buildContainer(
      { required Widget child}) {
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
    final theme = Theme.of(context);
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
            buildSectionTitle( title: 'Ingredients', theme: theme),
            buildContainer(
              child: ListView.builder(
                itemCount: selectMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: theme.accentColor,
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
            buildSectionTitle( title: 'Steps', theme: theme),
            buildContainer(
              child: ListView.builder(
                itemCount: selectMeal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.accentColor,
                        child: Text(
                          '#${index + 1}',
                          style: theme.textTheme.headline6,
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () => Navigator.pop(context, mealId),
      ),
    );
  }
}
