class Masker {
  int _id;
  String _total;

  // konstruktor versi 1
  Masker(this._total);

  // konstruktor versi 2: konversi dari Map ke Masker
  Masker.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._total = map['total'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id;
  String get total => _total;

  // setter
  set total(String value) {
    _total = value;
  }

  // konversi dari Masker ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['total'] = total;
    return map;
  }
}
