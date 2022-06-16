import 'package:flutter/material.dart';
import 'package:meals_application/screens/categoryMealsScreen.dart';
import 'package:meals_application/screens/mealDetails.dart';

import 'screens/categoriesScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        "/": (ctx) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
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
