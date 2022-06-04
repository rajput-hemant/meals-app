import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class MealsPage extends StatefulWidget {
  static const routeName = '/meals-details';
  // final String categoryId;
  // final String categoryTitle;

  const MealsPage({Key? key}) : super(key: key);

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  String categoryTitle = "";
  List<Meal> displayedMeals = [];
  var _loadInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = DUMMY_MEALS.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: ((context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageURL: displayedMeals[index].imageURL,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        }),
      ),
    );
  }
}
