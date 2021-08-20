import 'package:flutter/cupertino.dart';
import 'package:uirp/dataBase/InfoGetter2.dart';
import 'package:uirp/dataBase/leUser.dart';

class LeBicycle{
  String bicycle_id = "";
  var owner;
  DateTime timeRegistration = DateTime.now();
  int amountEarned = 0;
  List<LeBicycle> bicycles = [];

  // BorrowerTransactions transactions = [];

  void populateLeBicycleWithData(String bicycle_id) async{
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
    Duration parseTimeTraveled(Map<String, dynamic> json)
    {
      return Duration(
        days: json["days"],
        hours: json["hours"],
        minutes: json["minutes"],
        seconds: json["seconds"],
      );
    }
    Map<String, dynamic> myList = await info.get2(query);

    this.email = myList["users"][0]["email"];
    this.name =  myList["users"][0]["name"];
    this.surname = myList["users"][0]["surname"];
    var timestamp = myList["users"][0]["timeRegistration"];
    this.timeRegistration = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    this.balance = myList["users"][0]["balance"];
    print("Name is"+this.name);
  }


}