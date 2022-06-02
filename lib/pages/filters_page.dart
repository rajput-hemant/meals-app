import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatelessWidget {
  static const routeName = '/filters';
  const FiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: const Text('Filters Page!'),
    );
  }
}
