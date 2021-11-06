import 'package:flutter/cupertino.dart';
import 'package:uirp/dataBase/leBicycle.dart';

import 'package:uirp/dataBase/InfoGetter2.dart';

class LeUser with ChangeNotifier{
  String id = "";
  String email = "";
  String name = "";
  String surname = "";
  DateTime timeRegistration = DateTime.now();
  int balance = 0;
  List<LeBicycle> bicycles = [];
  // BorrowerTransactions transactions = [];

  void populateLeUserWithData(String email, BuildContext context) async {
    InfoGetter2 info = new InfoGetter2();
    print("Email is" + email);
    String query = '''
      {
        users(where:{email: "$email"}) {
          id
          __typename
          surname
          name
          email 
          timeRegistration
          bicycles{
            id
            timeRegistration
            amountEarned
          }
        }
      }
        ''';
    Map<String, dynamic> myList = await info.get2(query);
    this.id = myList["users"][0]["id"];
    this.email = myList["users"][0]["email"];
    this.name = myList["users"][0]["name"];
    this.surname = myList["users"][0]["surname"];
    var timestamp = int.parse(myList["users"][0]["timeRegistration"]);
    this.timeRegistration =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    this.balance = 0;

    var numOfBicycles = myList["users"][0]["bicycles"].length;
    if (numOfBicycles != 0) {
      var bicyclesList = myList["users"][0]["bicycles"];
      for (var i = 0; i < numOfBicycles; i++) {
        var bikeId = myList["users"][0]["bicycles"][i]["id"].toString();
        var bike = new LeBicycle();
        bike.bicycle_id = bicyclesList[i]["id"].toString();
        bike.name = bicyclesList[i]["id"].toString();
        var timestamp = int.parse(bicyclesList[i]["timeRegistration"]);
        bike.timeRegistration = DateTime.fromMillisecondsSinceEpoch(timestamp);
        bike.amountEarned = 0;
        bicycles.add(bike);
      }
      print("Name is" + this.name);
      notifyListeners();
    }
    print("Name is" + this.name);
    notifyListeners();
  }

  LeUser(String email, BuildContext context) {
    populateLeUserWithData(email, context);
  }

  update(BuildContext context){
    populateLeUserWithData(this.email, context);
    notifyListeners();
  }

  resetLeUser(String email, BuildContext context){
    populateLeUserWithData(email, context);
    notifyListeners();
  }

  void increment(int value) {
    balance = balance + value;
    notifyListeners();
  }

  void decrement(int value) {
    balance = balance - value;
    notifyListeners();
  }
}