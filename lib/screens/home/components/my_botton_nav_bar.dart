import 'package:flutter/material.dart';
import 'package:starwars_app/controler/constants.dart';

class MyBottonNavBar extends StatefulWidget {
  const MyBottonNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyBottonNavBar> createState() => _MyBottonNavBarState();
}

class _MyBottonNavBarState extends State<MyBottonNavBar> {
  @override
  Widget build(BuildContext context) {
    Icon favorito = Icon(Icons.favorite_border);
    return Container(
      height: 80,
      decoration: BoxDecoration(color: kbackgroundColor, boxShadow: [
        BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 35,
            color: kprimaryColor.withOpacity(0.38))
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.home_outlined)),
          IconButton(onPressed: () {}, icon: favorito),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.engineering_outlined))
        ],
      ),
    );
  }
}
