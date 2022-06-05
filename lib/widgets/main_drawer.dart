// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../pages/filters_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      {required String title,
      required IconData icon,
      required VoidCallback tapHandler}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            title: 'Meals',
            icon: Icons.restaurant,
            tapHandler: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          const Divider(),
          buildListTile(
            title: 'Filters',
            icon: Icons.settings,
            tapHandler: () =>
                Navigator.pushReplacementNamed(context, FiltersPage.routeName),
          ),
          const Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Text(
                'Made with ❤️ by rajput-hemant',
                style: Theme.of(context).textTheme.bodyLarge,
                textScaleFactor: 1.4,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
