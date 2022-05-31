import 'package:flutter/material.dart';

class MealsPage extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const MealsPage(
      {super.key, required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(
          'The Recipes for the $categoryTitle!',
        ),
      ),
    );
  }
}
