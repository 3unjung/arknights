import 'package:flutter/material.dart';

// permet d'utiliser des méthodes plus avancées pour notre navbar
class TheAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TheAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  // return notre navbar
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Center(
        child: Text(
          "Arknights Planner",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),


    );
  }
}