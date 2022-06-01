import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
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
    );
  }
}
