import 'package:flutter/material.dart';

import '/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Meals'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 150,
        ),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                id: catData.id, title: catData.title, color: catData.color))
            .toList(),
      ),
    );
  }
}
