import 'package:flutter/cupertino.dart';

class LeUser extends ChangeNotifier{
  String _name = "";
  String _email = "";

  LeUser() {
    this._name = "";
    this._email = "";
  }
  LeUser.fromJson(Map<String, dynamic> json)
      : this._name = json['name'],
        this._email = json['email'];

  Map<String, dynamic> toJson() => {
    'name': this._name,
    'email': this._email,
  };

  String getName() {
    return this._name;
  }
  String getEmail() {
    return this._email;
  }
  void setName(String name) {
    this._name = name;
    notifyListeners();
  }
  void setEmail(String email) {
    this._email = email;
    notifyListeners();
  }
}