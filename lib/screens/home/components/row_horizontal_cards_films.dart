import 'package:flutter/material.dart';
import 'package:starwars_app/screens/home/components/my_cards.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RowHorizontalCardsFilms extends StatefulWidget {
  const RowHorizontalCardsFilms({
    Key? key,
  }) : super(key: key);

  @override
  State<RowHorizontalCardsFilms> createState() => _RowHorizontalCardsState();
}

class _RowHorizontalCardsState extends State<RowHorizontalCardsFilms> {
  String? titulo;
  _recuperarFilmes() async {
    Uri url = Uri.parse('https://swapi.dev/api/films/1/');
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      titulo = retorno["title"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          titulo != null
              ? MyCards(
                  image: '$titulo',
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
