import 'package:flutter/cupertino.dart';

class LeUser with ChangeNotifier{
  String _name = "";
  String _email = "";

  LeUser() {
    this._name = "";
    this._email = "";
  }

  String get name => _name;

  String get email => _email;

  LeUser.fromJson(Map<String, dynamic> json)
      : this._name = json['name'],
        this._email = json['email'];

  Map<String, dynamic> toJson() => {
    'name': this._name,
    'email': this._email,
  };

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }
}