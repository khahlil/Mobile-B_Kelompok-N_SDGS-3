class TotalMasker {
  int _total;

  TotalMasker(this._total);

  TotalMasker.fromMap(Map<String, dynamic> map) {
    this._total = map['total'];
  }

  int get total => _total;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['total'] = this._total;
    // map['total'] = total;
    return map;
  }
}
