import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:starwars_app/controler/api_star_wars.dart';
import 'package:starwars_app/controler/constants.dart';
import 'package:starwars_app/controler/db_funcs.dart';
import 'package:starwars_app/screens/home/components/image_card.dart';

class FilmImageCard extends StatefulWidget {
  const FilmImageCard({Key? key}) : super(key: key);

  @override
  _FilmImageCardState createState() => _FilmImageCardState();
}

class _FilmImageCardState extends State<FilmImageCard> {
  String urlBase = 'https://swapi.dev/api';

  Future<List<ApiStarWars>> _recuperarFilmes() async {
    Uri url = Uri.parse(urlBase + '/films');

    http.Response response = await http.get(url);
    var dadosJson = json.decode(response.body);

    List<ApiStarWars> filmTitle = [];

    for (var filme in dadosJson["results"]) {
      ApiStarWars f = ApiStarWars(filme["title"]);
      filmTitle.add(f);
    }

    return filmTitle;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: FutureBuilder<List<ApiStarWars>>(
        future: _recuperarFilmes(),
        builder: (context, snapshot) {
          Widget body = const Text('');

          switch (snapshot.connectionState) {
            case ConnectionState.active:
              break;
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              body = SizedBox(
                width: 10,
                height: 10,
                child: Center(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    'https://c.tenor.com/mGZ-UlTs9SgAAAAM/baby-yoda.gif',
                    fit: BoxFit.cover,
                  ),
                )),
              );

              break;
            case ConnectionState.done:
              body = ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  List<ApiStarWars> lista = snapshot.data!;
                  ApiStarWars filme = lista[index];

                  return ImageCard(
                      title: filme.filmTitle,
                      imageUrl: filmPosters[index],
                      onTap: () {
                        salvarFilme(index, filme.filmTitle, filmPosters[index]);
                      });
                },
              );
          }
          return body;
        },
      ),
    );
  }
}
