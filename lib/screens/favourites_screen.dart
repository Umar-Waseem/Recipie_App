import "package:flutter/material.dart";

import '../mealItem.dart';
import '../models/meal.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favorites;

  const Favourites({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return const Center(child: Text("No favourites added yet!"));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favorites[index].id,
            title: favorites[index].title,
            imageUrl: favorites[index].imageUrl,
            duration: favorites[index].duration,
            complexity: favorites[index].complexity,
            affordability: favorites[index].affordability,
          );
        },
        itemCount: favorites.length,
      );
    }
  }
}
