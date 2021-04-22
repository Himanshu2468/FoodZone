import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screeen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      "page": CategoriesScreen(),
      "title": "Categories",
    },
    {
      "page": FavoritesScreen(),
      "title": "Your Favorite",
    },
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorities"),
          ),
        ],
      ),
    );
  }
}

// This is default code for TabBar below just appBar.
// DefaultTabController(
//       // initialIndex: 0,
//       length: 2, //number of quarter
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Meals"),
//           bottom: TabBar(tabs: [
//             Tab(
//               icon: Icon(
//                 Icons.category,
//               ),
//               text: "Catgories",
//             ),
//             Tab(
//               icon: Icon(Icons.favorite),
//               text: "Favorites",
//             ),
//           ]),
//         ),
//         body: TabBarView(children: [
//           CategoriesScreen(),
//           FavoritesScreen(),
//         ]),
//       ),
//     );
