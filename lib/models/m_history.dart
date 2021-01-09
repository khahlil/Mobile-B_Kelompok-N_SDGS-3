class History {
  int _id;
  String _hari;
  String _date;
  String _time;

  History(this._time, this._hari, this._date);

  History.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._hari = map['hari'];
    this._date = map['date'];
    this._time = map['time'];
  }

  int get id => _id;
  // ignore: unnecessary_getters_setters
  String get hari => _hari;
  // ignore: unnecessary_getters_setters
  String get date => _date;
  // ignore: unnecessary_getters_setters
  String get time => _time;

  // ignore: unnecessary_getters_setters
  set time(String value) {
    _time = value;
  }

  // ignore: unnecessary_getters_setters
  set date(String value) {
    _date = value;
  }

  // ignore: unnecessary_getters_setters
  set hari(String value) {
    _hari = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['hari'] = hari;
    map['date'] = date;
    map['time'] = time;
    return map;
  }
}
