// ignore_for_file: file_names, avoid_print

import "package:flutter/material.dart";
import "../data/dummy_data.dart";

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal detail screen";

  final Function toggleFav;
  final Function isFav;

  const MealDetailScreen(
      {Key? key, required this.toggleFav, required this.isFav})
      : super(key: key);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget cont) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 200,
      width: 300,
      margin: const EdgeInsets.only(bottom: 50),
      child: cont,
    );
  }

  @override
  Widget build(BuildContext context) {
    String? mealid = ModalRoute.of(context)?.settings.arguments.toString();
    mealid = mealid!.replaceAll(RegExp(r'{'), '');
    mealid = mealid.replaceAll(RegExp(r'}'), '');
    final selectedMeal = dummyMeals.firstWhere((meal) => mealid == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredients", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle("Steps", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                        backgroundColor: Colors.blueGrey,
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    const Divider(color: Colors.black12, thickness: 4),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFav(mealid) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFav(mealid),
      ),
    );
  }
}
