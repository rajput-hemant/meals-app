import 'package:flutter/material.dart';

import 'pages/categories_page.dart';
import 'pages/meal_recipe_page.dart';
import 'pages/meals_details_page.dart';
import 'pages/tabs_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        MealsPage.routeName: (context) => const MealsPage(),
        RecipePage.routeName: (context) => const RecipePage(),
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
