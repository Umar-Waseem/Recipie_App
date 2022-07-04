import "package:flutter/material.dart";
import 'package:meals_application/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, void Function() tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "RobotCondensed",
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: tapHandler,
    );
  }

  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.secondary,
                child: const Text(
                  "Cooking Up",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                height: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 20),
              buildListTile(
                "Meals",
                Icons.restaurant,
                () {
                  Navigator.of(context).pushReplacementNamed("/");
                },
              ),
              buildListTile(
                "Settings",
                Icons.settings,
                () {
                  Navigator.of(context)
                      .pushReplacementNamed(FiltersScreen.routeName);
                },
              ),
            ],
          ),
          // const SizedBox(height: 400),
          Align(
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              height: 80,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
