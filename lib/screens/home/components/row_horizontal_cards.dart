import 'package:flutter/material.dart';
import 'package:starwars_app/screens/home/components/my_cards.dart';

class RowHorizontalCards extends StatelessWidget {
  const RowHorizontalCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = 5;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MyCards(
            image: 'Titulo',
            title: 'Em breve...',
            press: () {},
            description: 'Manutenção :D',
          ),
          MyCards(
            image: 'Titulo',
            title: 'Em breve...',
            press: () {},
            description: 'Manutenção :D',
          ),
          MyCards(
            image: 'Titulo',
            title: 'Em breve...',
            press: () {},
            description: 'Manutenção :D',
          ),
          MyCards(
            image: 'Titulo',
            title: 'Em breve...',
            press: () {},
            description: 'Manutenção :D',
          ),
          MyCards(
            image: 'Titulo',
            title: 'Em breve...',
            press: () {},
            description: 'Manutenção :D',
          )
        ],
      ),
    );
  }
}
