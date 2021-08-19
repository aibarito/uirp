import 'package:flutter/cupertino.dart';
import 'package:uirp/dataBase/leBicycle.dart';

import 'package:uirp/dataBase/InfoGetter2.dart';

class LeUser with ChangeNotifier{
  String email = "";
  String name = "";
  String surname = "";
  String timeRegistration = "";
  int balance = 0;
  List<LeBicycle> bicycles = [];
  // BorrowerTransactions transactions = [];

  void populateLeUserWithData() async{
    InfoGetter2 info = new InfoGetter2();
    print("Email is" + email);
    String query = '''
      {
        users(where:{email: "$email"}) {
          id
          __typename
          name
          email 
          timeRegistration
        }
      }
        ''';

    Map<String, dynamic> myList = await info.get2(query);

    this.email = myList["users"][0]["email"];
    this.name =  myList["users"][0]["name"];
    this.surname = myList["users"][0]["surname"];
    this.timeRegistration = myList["users"][0]["timeRegistration"];
    LeUser x = LeUser.fromJson(userMap);
    print("Name is"+x.name);
    return x;
  }
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