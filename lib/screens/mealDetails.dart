// ignore_for_file: file_names

import "package:flutter/material.dart";
import "../data/dummy_data.dart";

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal detail screen";

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? mealId =
        ModalRoute?.of(context)?.settings.arguments.toString();
    // print(mealId);\
    final selectedMeal = dummyMeals.firstWhere(
      (meal) {
        if (meal.id == mealId) {
          return true;
        }
        return false;
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Detail - $mealId"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
