import 'package:flutter/material.dart';
import 'package:starwars_app/controler/constants.dart';

class MyBottonNavBar extends StatelessWidget {
  const MyBottonNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
              )),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.engineering_outlined))
        ],
      ),
    );
  }
}
