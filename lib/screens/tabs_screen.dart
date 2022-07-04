import "package:flutter/material.dart";
import 'package:meals_application/models/meal.dart';
import 'package:meals_application/screens/categoriesScreen.dart';
import 'package:meals_application/screens/favourites_screen.dart';
import 'package:meals_application/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favs;

  const TabScreen({Key? key, required this.favs}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        "page": const CategoriesScreen(),
        "title": "Categories",
      },
      {
        "page": Favourites(favorites: widget.favs),
        "title": "Your Favourites",
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"] as String),
      ),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
