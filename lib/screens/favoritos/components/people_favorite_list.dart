import 'package:flutter/material.dart';
import 'package:starwars_app/controler/db_funcs.dart';
import 'package:starwars_app/screens/home/components/image_card.dart';

class PeopleFavoriteList extends StatefulWidget {
  const PeopleFavoriteList({Key? key}) : super(key: key);

  @override
  _PeopleFavoriteListState createState() => _PeopleFavoriteListState();
}

class _PeopleFavoriteListState extends State<PeopleFavoriteList> {
  Favoritos favoritos = Favoritos();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: FutureBuilder<dynamic>(
        future: favoritos.recuperarPersonagensFavoritos(),
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
                  itemCount: favoritos.favoritePeople!.length,
                  itemBuilder: (context, index) {
                    return ImageCard(
                        title: favoritos.favoritePeople![index]["name"],
                        imageUrl: favoritos.favoritePeople![index]["img"],
                        onTap: () {
                          setState(() {
                            favoritos.excluirPeopleFavorito(
                                favoritos.favoritePeople![index]["name"]);
                          });
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
