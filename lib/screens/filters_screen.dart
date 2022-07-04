import "package:flutter/material.dart";

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "filter screen";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  dynamic _glutenFree;
  dynamic _vegan;
  dynamic _vegetarian;
  dynamic _lactoseFree;

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"];
    _vegan = widget.currentFilters["vegan"];
    _vegetarian = widget.currentFilters["vegeterian"];
    _lactoseFree = widget.currentFilters["lactose"];
    super.initState();
  }

  Widget buildSwitchTile(
      bool filter, String title, String subtitle, void Function(bool) update) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: filter,
      onChanged: update,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters for selecting meals"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Map<String, bool> selectedFilters = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegeterian": _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Filters or Meal Selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchTile(_glutenFree, "Gluten Free",
                    "Turn on to get gluten free meals", (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchTile(_vegan, "Vegan", "Turn on to get Vegan meals",
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                buildSwitchTile(_vegetarian, "Vegeterian",
                    "Turn on to get Vegeterian meals", (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildSwitchTile(_lactoseFree, "Lactose Free",
                    "Turn on to get lactose free meals", (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
