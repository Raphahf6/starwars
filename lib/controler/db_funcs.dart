import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

List favoriteFilms = [];
List favoritePeople = [];

recuperarBancoDeDados() async {
  final caminhoBancoDeDados = await getDatabasesPath();
  final localBancoDeDados = join(caminhoBancoDeDados, 'starWars.db');

  var bd = await openDatabase(localBancoDeDados, version: 1,
      onCreate: (db, dbVersaoRecente) {
    String sql = 'CREATE TABLE filmes (id INTEGER , titulo TEXT, img TEXT)';
    db.execute(sql);
  });

  return bd;
}

recuperarBancoDeDadosPeople() async {
  final caminhoBancoDeDados = await getDatabasesPath();
  final localBancoDeDados = join(caminhoBancoDeDados, 'starWarsPeople.db');

  var bd = await openDatabase(localBancoDeDados, version: 1,
      onCreate: (db, dbVersaoRecente) {
    String sql = 'CREATE TABLE personagens (id INTEGER , name TEXT, img TEXT)';
    db.execute(sql);
  });

  return bd;
}

salvarFilme(int index, titulo, img) async {
  Database bd = await recuperarBancoDeDados();

  Map<String, dynamic> dadosFilmeFavorito = {
    "id": "$index",
    "titulo": "$titulo",
    "img": "$img"
  };
  return await bd.insert('filmes', dadosFilmeFavorito);
}

salvarPersonagem(int index, name, img) async {
  Database bd = await recuperarBancoDeDadosPeople();

  Map<String, dynamic> dadosPeopleFavorito = {
    "id": "$index",
    "name": "$name",
    "img": "$img"
  };
  return await bd.insert('personagens', dadosPeopleFavorito);
}

recuperarFilmesFavoritos() async {
  favoriteFilms.clear();
  Database bd = await recuperarBancoDeDados();
  String sql = 'SELECT * FROM filmes';
  List filmesFavoritos = await bd.rawQuery(sql);

  for (var filmes in filmesFavoritos) {
    favoriteFilms.add(filmes);
  }
}

recuperarPersonagensFavoritos() async {
  favoritePeople.clear();
  Database bd = await recuperarBancoDeDadosPeople();
  String sql = 'SELECT * FROM personagens';
  List personagensFavoritos = await bd.rawQuery(sql);

  for (var people in personagensFavoritos) {
    if (favoritePeople.contains(people)) {
    } else {
      favoritePeople.add(people);
    }
  }
}

excluirFilmeFavorito(String titulo) async {
  Database bd = await recuperarBancoDeDados();

  bd.delete(
    "filmes",
    where: "titulo = ?",
    whereArgs: [titulo],
  );
}

excluirPeopleFavorito(String name) async {
  Database bd = await recuperarBancoDeDadosPeople();

  bd.delete(
    "personagens",
    where: "name = ?",
    whereArgs: [name],
  );
}
