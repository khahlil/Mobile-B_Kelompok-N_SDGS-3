class Masker {
  int _id;
  String _total;

  Masker(this._total);

  Masker.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._total = map['total'];
  }

  int get id => _id;
  // ignore: unnecessary_getters_setters
  String get total => _total;

  // ignore: unnecessary_getters_setters
  set total(String value) {
    _total = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['total'] = total;
    return map;
  }
}
