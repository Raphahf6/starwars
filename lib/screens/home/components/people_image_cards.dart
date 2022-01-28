import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starwars_app/controler/api_star_wars.dart';
import 'dart:convert';

import 'package:starwars_app/controler/constants.dart';
import 'package:starwars_app/controler/db_funcs.dart';
import 'package:starwars_app/screens/home/components/image_card.dart';

class PeopleImageCards extends StatefulWidget {
  const PeopleImageCards({Key? key}) : super(key: key);

  @override
  _PeopleImageCardsState createState() => _PeopleImageCardsState();
}

class _PeopleImageCardsState extends State<PeopleImageCards> {
  String urlBase = 'https://swapi.dev/api';

  Future<List<PeopleListApi>> _recuperarPeople() async {
    Uri url = Uri.parse(urlBase + '/people');

    http.Response response = await http.get(url);
    var dadosJson = json.decode(response.body);

    List<PeopleListApi> peopleName = [];

    for (var people in dadosJson["results"]) {
      PeopleListApi p = PeopleListApi(people["name"]);
      peopleName.add(p);
    }

    return peopleName;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: FutureBuilder<dynamic>(
        future: _recuperarPeople(),
        builder: (context, snapshot) {
          Widget body = const Text('');

          switch (snapshot.connectionState) {
            case ConnectionState.active:
              break;
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              body = body = SizedBox(
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
              if (snapshot.hasError) {
              } else {
                body = ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 06,
                  itemBuilder: (context, index) {
                    List<PeopleListApi> list = snapshot.data!;
                    PeopleListApi people = list[index];

                    return ImageCard(
                        title: people.peopleName,
                        imageUrl: peopleImg[index],
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: Text(people.peopleName,
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  content: Text(
                                      'Deseja adicionar ${people.peopleName} como favorito ?',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  backgroundColor: kprimaryColor,
                                  elevation: 10,
                                  actions: [
                                    TextButton(
                                        onPressed: () =>
                                            {Navigator.pop(context)},
                                        child: const Text('Não')),
                                    TextButton(
                                        onPressed: () => {
                                              salvarPersonagem(
                                                index,
                                                people.peopleName,
                                                peopleImg[index],
                                              ),
                                              Navigator.pop(context)
                                            },
                                        child: const Text('Sim'))
                                  ],
                                );
                              });
                          //
                        });
                  },
                );
              }
          }
          return body;
        },
      ),
    );
  }
}
