import 'dart:convert';

Duration parseTimeTraveled(Map<String, dynamic> json)
{
  return Duration(
    days: json["days"],
    hours: json["hours"],
    minutes: json["minutes"],
    seconds: json["seconds"],
  );
}

class LeBicycle {
  double _amountEarned;
  Duration _timeTraveled;
  int _id;
  String _name;
  LeBicycle.fromJson(Map<String, dynamic> json)
      : this._amountEarned = json["amountEarned"],
        this._timeTraveled = parseTimeTraveled(json["timeTraveled"]),
        this._id = json["id"],
        this._name = json["name"] != null ? json["name"] : "no name";
  Map<String, dynamic> toJson() => {
    'amountEarned': this._amountEarned,
    'timeTraveled': this._timeTraveled,
    'id' : this._id,
    'name': this._name,
  };

  double get amountEarned => _amountEarned;

  set name(String value) {
    _name = value;
  }

  set id(int value) {
    _id = value;
  }

  set timeTraveled(Duration value) {
    _timeTraveled = value;
  }

  set amountEarned(double value) {
    _amountEarned = value;
  }

  Duration get timeTraveled => _timeTraveled;

  int get id => _id;

  String get name => this._name;
}

Map<String, dynamic> str = jsonDecode("{\"id\":0, \"amountEarned\":0.0,"
    "\"timeTraveled\":1.5, \"name\":\"bicycle#1\"}");
LeBicycle demoLeBicycle = new LeBicycle.fromJson(str);