import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  static const routeName = "/meal-recipe";
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Page'),
      ),
      body: Center(
        child: Text('The meal - $mealId'),
      ),
    );
  }
}
