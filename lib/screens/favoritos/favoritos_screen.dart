import 'package:flutter/material.dart';
import 'package:starwars_app/screens/favoritos/components/film_favorite_list.dart';
import 'package:starwars_app/screens/favoritos/components/people_favorite_list.dart';
import 'package:starwars_app/screens/home/components/session_title.dart';

class FavoritosScreen extends StatefulWidget {
  const FavoritosScreen({Key? key}) : super(key: key);

  @override
  _FavoritosScreenState createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Favoritos'),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SessionTitle(title: 'Filmes Favoritos', press: () {}),
              const FilmFavoriteList(),
              SessionTitle(title: 'Personagens Favoritos', press: () {}),
              const PeopleFavoriteList()
            ],
          ),
        ),
      ]),
    );
  }
}
