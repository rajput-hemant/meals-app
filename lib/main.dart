import 'package:flutter/material.dart';

import 'models/meals.dart';
import 'pages/categories_page.dart';
import 'pages/meal_recipe_page.dart';
import 'pages/filters_page.dart';
import 'pages/meals_details_page.dart';
import 'pages/tabs_page.dart';
import 'dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoCondensed',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': ((context) => const TabsPage()),
        MealsPage.routeName: (context) =>
            MealsPage(availableMeals: _availableMeals),
        RecipePage.routeName: (context) => const RecipePage(),
        FiltersPage.routeName: ((context) =>
            FiltersPage(currentFilters: _filters, saveFilters: _setFilters)),
      },
      // this is used as a fallback mechanism when a requested route is not present in the route table
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (context) => const CategoriesPage(),
      //   );
      // },
      // this is used in case of app failure  (when app is unable to generate a page)
      // or when route table is empty & onGenerateRoute isn't defined
      // this can be a "Page not Found" or "Error 404" page
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesPage(),
        );
      },
    );
  }
}
