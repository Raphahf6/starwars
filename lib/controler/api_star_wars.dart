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
