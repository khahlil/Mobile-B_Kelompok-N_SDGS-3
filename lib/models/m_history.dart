class History {
  int _id;
  String _time;
  String _date;

  // konstruktor versi 1
  History(this._time, this._date);

  // konstruktor versi 2: konversi dari Map ke History
  History.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._time = map['time'];
    this._date = map['date'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id;
  String get time => _time;
  String get date => _date;

  // setter
  set time(String value) {
    _time = value;
  }

  set date(String value) {
    _date = value;
  }

  // konversi dari History ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['time'] = time;
    map['date'] = date;
    return map;
  }
}
