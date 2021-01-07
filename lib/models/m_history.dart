class History {
  int _id;
  String _hari;
  String _date;
  String _time;

  // konstruktor versi 1
  History(this._time, this._hari, this._date);

  // konstruktor versi 2: konversi dari Map ke History
  History.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._hari = map['hari'];
    this._date = map['date'];
    this._time = map['time'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id;
  String get hari => _hari;
  String get date => _date;
  String get time => _time;

  // setter
  set time(String value) {
    _time = value;
  }

  set date(String value) {
    _date = value;
  }

  set hari(String value) {
    _hari = value;
  }

  // konversi dari History ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['hari'] = hari;
    map['date'] = date;
    map['time'] = time;
    return map;
  }
}
