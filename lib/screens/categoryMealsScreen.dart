// ignore_for_file: file_names

import "package:flutter/material.dart";
import 'package:meals_application/mealItem.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  static const routeName =
      "/category meals"; // can be accessed without object anywhere

  const CategoryMealsScreen({
    Key? key,
    // required this.categoryId,
    // required this.categoryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArguments["title"];
    final categoryId = routeArguments["id"];

    final mealCategory = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: mealCategory[index].id,
            title: mealCategory[index].title,
            imageUrl: mealCategory[index].imageUrl,
            duration: mealCategory[index].duration,
            complexity: mealCategory[index].complexity,
            affordability: mealCategory[index].affordability,
          );
        },
        itemCount: mealCategory.length,
      ),
    );
  }
}
