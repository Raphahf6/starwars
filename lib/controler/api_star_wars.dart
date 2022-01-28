// ignore_for_file: unnecessary_this

class ApiStarWars {
  String _filmTitle;

  ApiStarWars(this._filmTitle);

  String get filmTitle => _filmTitle;
  set filmTitle(String value) {
    _filmTitle = value;
  }
}

class PeopleListApi {
  String _peopleName;

  PeopleListApi(this._peopleName);

  String get peopleName => _peopleName;
  set peopleName(String value) {
    _peopleName = value;
  }
}

class FavoriteFilm {
  int? id;
  String? filmTitle;
  String? img;

  FavoriteFilm(
    this.filmTitle,
    this.img,
  );

  FavoriteFilm.fromMap(Map map) {
    filmTitle = map["titulo"];
    img = map["img"];
  }

  Map? toMap() {
    Map<String, dynamic> map = {"titulo": this.filmTitle, "img": this.img};
    if (this.id != null) {
      map["id"] = this.id;
    }

    return map;
  }
}
