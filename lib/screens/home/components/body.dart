import 'dart:async';

import 'package:flutter/material.dart';
import 'package:starwars_app/controler/constants.dart';
import 'package:starwars_app/screens/home/components/row_horizontal_cards_films.dart';
import 'package:starwars_app/screens/home/components/row_horizontal_cards_people.dart';
import 'package:starwars_app/screens/home/components/session_title.dart';
import 'my_header.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demoji/demoji.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List _peopleName = [];
  List _titleFilms = [];

  String? titulo;

  String telaAtual = 'films';

  _recuperarFilmes() async {
    Uri url = Uri.parse('https://swapi.dev/api/films/');
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    int count = retorno["count"];

    for (var i = 1; i <= count; i++) {
      Uri url = Uri.parse('https://swapi.dev/api/films/${i.toString()}/');
      http.Response response;
      response = await http.get(url);

      Map<String, dynamic> retorno = json.decode(response.body);

      if (retorno["title"] != null && _titleFilms.length < count) {
        setState(() {
          _titleFilms.add(retorno["title"]);
        });
      }
    }
  }

  _recuperarPeople() async {
    Uri url = Uri.parse('https://swapi.dev/api/people/');
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    int count = retorno["count"];

    for (var i = 1; i <= count; i++) {
      Uri url = Uri.parse('https://swapi.dev/api/people/${i.toString()}/');
      http.Response response;
      response = await http.get(url);

      Map<String, dynamic> retorno = json.decode(response.body);

      if (retorno["name"] != null && _peopleName.length < count) {
        setState(() {
          _peopleName.add(retorno["name"]);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          MyHeader(size: size),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  elevation: 10,
                  fixedSize: Size(100, 40)),
              onPressed: () {
                setState(() {
                  telaAtual = 'films';
                });
                _recuperarFilmes();
              },
              child: Text('Filmes'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  elevation: 10,
                  fixedSize: Size(120, 40)),
              onPressed: () {
                setState(() {
                  telaAtual = 'people';
                });

                _recuperarPeople();
              },
              child: Text('Personagens'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  elevation: 10,
                  fixedSize: Size(100, 40)),
              onPressed: () {},
              child: Text('Favoritos'),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                  width: size.width,
                  height: size.height * .4,
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(kdefaultPadding),
                      child: telaAtual == "people"
                          ? ListView.builder(
                              itemCount: _peopleName.length,
                              itemBuilder: (context, indice) {
                                return ListTile(
                                  title: Container(
                                    width: size.width * .1 / 2,
                                    height: size.height * .1 / 2,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(_peopleName[indice]),
                                          Spacer(),
                                          GestureDetector(
                                              onTap: () {},
                                              child:
                                                  Icon(Icons.favorite_border)),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                          : telaAtual == 'films'
                              ? ListView.builder(
                                  itemCount: _titleFilms.length,
                                  itemBuilder: (context, indice) {
                                    return ListTile(
                                      title: Container(
                                        width: size.width * .1 / 2,
                                        height: size.height * .1 / 2,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(_titleFilms[indice]),
                                              Spacer(),
                                              GestureDetector(
                                                  onTap: () {},
                                                  child: Icon(
                                                      Icons.favorite_border)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : Text(''))),
            ),
          )
        ],
      ),
    );
  }
}
