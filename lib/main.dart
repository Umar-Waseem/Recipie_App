import 'package:flutter/material.dart';
import 'package:meals_application/data/dummy_data.dart';
import 'package:meals_application/screens/categoryMealsScreen.dart';
import 'package:meals_application/screens/filters_screen.dart';
import 'package:meals_application/screens/mealDetails.dart';
import 'package:meals_application/screens/tabs_screen.dart';

import 'models/meal.dart';
import 'screens/categoriesScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegeterian": false,
  };
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> favMeals = [];

  void _toggleFavorites(String mealid) {
    final existingIndex =
        favMeals.indexWhere((element) => mealid == element.id);

    if (existingIndex >= 0) {
      setState(() {
        favMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favMeals.add(dummyMeals.firstWhere((element) => mealid == element.id));
      });
    }
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyMeals.where((element) {
        if (_filters["gluten"] ?? !element.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] ?? !element.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] ?? !element.isVegan) {
          return false;
        }
        if (_filters["vegeterian"] ?? !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFavorite(String id) {
    return favMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 18,
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: const CategoriesScreen(), //~ the main screen
      initialRoute:
          "/", // default value is "/" , this is the screen the app starts with
      routes: {
        "/": (ctx) => TabScreen(favs: favMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFav: _toggleFavorites, isFav: _isMealFavorite ),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(currentFilters: _filters, saveFilters: _setFilters),
      },
      onGenerateRoute: (settings) {
        // print("onGenerateRoute: ${settings.arguments}");
        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        // when a screen fails to build
        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      },
    );
  }
}
