import 'package:flutter/material.dart';
import 'package:starwars_app/screens/home/components/my_cards.dart';

class RowHorizontalCards extends StatelessWidget {
  const RowHorizontalCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Row(
          children: [
            MyCards(
              image: 'Titulo',
              title: 'Em breve...',
              press: () {},
              description: 'Manutenção :D',
            ),
          ],
        );
      },
    );
  }
}
