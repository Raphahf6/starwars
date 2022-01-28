import 'package:flutter/material.dart';
import 'package:starwars_app/controler/constants.dart';
import 'package:starwars_app/screens/favoritos/favoritos_screen.dart';
import 'package:starwars_app/screens/home/components/films_image_cards.dart';
import 'package:starwars_app/screens/home/components/people_list.dart';
import 'package:starwars_app/screens/home/components/session_title.dart';
import 'package:starwars_app/screens/webview/webview_screen.dart';
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
      padding: const EdgeInsets.all(0),
      children: [
        MyHeader(size: size),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SessionTitle(title: "Filmes", press: () {}),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyWebView(),
                        ));
                  },
                  child: const Text(
                    'Site Oficial',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      minimumSize: const Size(90, 45),
                      backgroundColor: kprimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoritosScreen(),
                      ));
                },
                child: const Text(
                  'Favoritos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                style: TextButton.styleFrom(
                    minimumSize: const Size(90, 45),
                    backgroundColor: kprimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              )
            ],
          ),
        ),
        const FilmImageCard(),
        SessionTitle(title: 'Alguns Personagens', press: () {}),
        const PeopleList()
      ],
    );
  }
}
