import 'package:flutter/material.dart';
import 'package:starwars_app/screens/home/components/films_image_cards.dart';
import 'package:starwars_app/screens/home/components/people_list.dart';
import 'package:starwars_app/screens/home/components/session_title.dart';
import 'my_header.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // habilita scroll em devices pequenos ;
    return ListView(
      padding: EdgeInsets.all(5),
      children: [
        MyHeader(size: size),
        SessionTitle(title: "Filmes", press: () {}),
        const FilmImageCard(),
        SessionTitle(title: 'Alguns Personagens', press: () {}),
        PeopleList()
      ],
    );
  }
}
