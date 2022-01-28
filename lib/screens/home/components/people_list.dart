import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:starwars_app/controler/constants.dart';
import 'package:starwars_app/screens/home/components/image_card.dart';

class PeopleList extends StatefulWidget {
  const PeopleList({Key? key}) : super(key: key);

  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  String urlBase = 'https://swapi.dev/api';
  List peopleName = [];

  _recuperarPeople() async {
    Uri url = Uri.parse('https://swapi.dev/api/people/');
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    int count = retorno["count"];

    for (var i = 1; i <= 08; i++) {
      Uri url = Uri.parse('https://swapi.dev/api/people/${i.toString()}/');
      http.Response response;
      response = await http.get(url);

      Map<String, dynamic> retorno = json.decode(response.body);

      if (retorno["name"] != null && peopleName.length < count) {
        peopleName.add(retorno["name"]);
      }
    }
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
                    return ImageCard(
                        title: peopleName[index],
                        imageUrl: peopleImg[index],
                        onTap: () {});
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
