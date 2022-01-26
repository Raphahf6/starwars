import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:starwars_app/controler/constants.dart';
import 'package:starwars_app/screens/home/components/row_horizontal_cards.dart';
import 'package:starwars_app/screens/home/components/session_title.dart';
import 'my_header.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String urlBase = 'https://swapi.dev/api/';

  Future<Map> _recuperarFilmes() async {
    Uri url = Uri.parse(urlBase + 'films/1');
    http.Response response = await http.get(url);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // habilita scroll em devices pequenos ;
    return Column(
      children: [
        MyHeader(size: size),
        SessionTitle(title: "Filmes", press: () {}),
        Expanded(
          flex: 01,
          child: ListView.builder(
            itemCount: 05,
            itemBuilder: (context, index) {
              return ListTile(
                title: FutureBuilder<Map>(
                  future: _recuperarFilmes(),
                  builder: (context, snapshot) {
                    String? resultado;
                    Widget widget = Text('data');

                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        resultado = 'carregando';
                        widget = Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        );

                        break;
                      case ConnectionState.done:
                        resultado = snapshot.data!["title"];
                        widget = Row(
                          children: [
                            Text(resultado!),
                            Spacer(),
                            Icon(Icons.favorite_border)
                          ],
                        );
                        break;
                    }

                    return ListTile(
                      title: widget,
                    );
                  },
                ),
              );
            },
          ),
        ),
        SessionTitle(title: 'Personagens', press: () {}),
        Expanded(
          flex: 02,
          child: ListView.builder(
            itemCount: 05,
            itemBuilder: (context, index) {
              return ListTile(
                title: FutureBuilder<Map>(
                  future: _recuperarFilmes(),
                  builder: (context, snapshot) {
                    String? resultado;
                    Widget widget = Text('data');

                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        resultado = 'carregando';
                        widget = Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        );

                        break;
                      case ConnectionState.done:
                        resultado = snapshot.data!["title"];
                        widget = Row(
                          children: [
                            Text(resultado!),
                            Spacer(),
                            Icon(Icons.favorite_border)
                          ],
                        );
                        break;
                    }

                    return ListTile(title: widget);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
