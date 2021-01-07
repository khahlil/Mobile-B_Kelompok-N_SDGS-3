class Masker {
  int _id;
  String _lapse;
  String _date;

  // konstruktor versi 1
  Masker(this._lapse, this._date);

  // konstruktor versi 2: konversi dari Map ke Masker
  Masker.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._lapse = map['lapse'];
    this._date = map['date'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id;
  String get lapse => _lapse;
  String get date => _date;

  // setter
  set lapse(String value) {
    _lapse = value;
  }

  set date(String value) {
    _date = value;
  }

  // konversi dari Masker ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['lapse'] = lapse;
    map['date'] = date;
    return map;
  }
}
