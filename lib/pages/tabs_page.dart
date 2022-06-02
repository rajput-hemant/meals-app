import 'package:flutter/material.dart';

import 'categories_page.dart';
import 'favourites_page.dart';
import '../widgets/main_drawer.dart';

/// for tabs at the top
class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map> _pages = const [
    {
      'title': 'Categories',
      'page': CategoriesPage(),
    },
    {
      'title': 'Favourites',
      'page': FavouritesPage(),
    },
  ];

  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() => _selectPageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: theme.primaryColor,
        selectedItemColor: theme.accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            // backgroundColor: theme.primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            // backgroundColor: theme.primaryColor,
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}

/// for tabs at the top
// class TabsPage extends StatelessWidget {
//   const TabsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Daily Meals'),
//           centerTitle: true,
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Category',
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite),
//                 text: 'Favourite',
//               )
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             CategoriesPage(),
//             FavouritesPage(),
//           ],
//         ),
//       ),
//     );
//   }
// }
