import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:starwars_app/controler/api_star_wars.dart';

List favoriteFilms = [];

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

salvar(int index, titulo, img) async {
  Database bd = await recuperarBancoDeDados();

  Map<String, dynamic> dadosFilmeFavorito = {
    "id": "$index",
    "titulo": "$titulo",
    "img": "$img"
  };
  int id = await bd.insert('filmes', dadosFilmeFavorito);
}

listarFilmesFavoritos() async {
  Database bd = await recuperarBancoDeDados();
  String sql = 'SELECT * FROM filmes';
  List filmesFavoritos = await bd.rawQuery(sql);

  for (var filmes in filmesFavoritos) {
    return print(filmes["titulo"]);
  }
}

recuperarFilmesFavoritos() async {
  favoriteFilms.clear();
  Database bd = await recuperarBancoDeDados();
  String sql = 'SELECT * FROM filmes';
  List filmesFavoritos = await bd.rawQuery(sql);

  for (var filmes in filmesFavoritos) {
    favoriteFilms.add(filmes);
  }

  print(favoriteFilms[0]["titulo"] + favoriteFilms[0]["img"]);
}

excluirUsuario(String titulo) async {
  Database bd = await recuperarBancoDeDados();

  bd.delete(
    "filmes",
    where: "titulo = ?",
    whereArgs: [titulo],
  );
}
