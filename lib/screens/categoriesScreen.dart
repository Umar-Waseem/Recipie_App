// ignore_for_file: file_names

import "package:flutter/material.dart";
import '../data/dummy_data.dart';
import '../categoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      children: dummyCategories.map(
        (catData) {
          return CategoryItem(
            id: catData.id,
            title: catData.title,
            color: catData.color,
          );
        },
      ).toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
