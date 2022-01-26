import 'package:flutter/material.dart';
import 'package:starwars_app/screens/home/components/my_cards.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RowHorizontalCardsPeople extends StatefulWidget {
  const RowHorizontalCardsPeople({
    Key? key,
  }) : super(key: key);

  @override
  State<RowHorizontalCardsPeople> createState() => _RowHorizontalCardsState();
}

class _RowHorizontalCardsState extends State<RowHorizontalCardsPeople> {
  String? name;
  _recuperarFilmes() async {
    Uri url = Uri.parse('https://swapi.dev/api/people/1/');
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      name = retorno["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          name != null
              ? MyCards(
                  image: '$name',
                  title: 'Em breve...',
                  press: () {},
                  description: 'Manutenção :D',
                )
              : MyCards(
                  image: '',
                  title: 'Em breve...',
                  press: () {},
                  description: 'Manutenção :D',
                ),
        ],
      ),
    );
  }
}
