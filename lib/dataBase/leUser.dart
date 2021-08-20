import 'package:flutter/cupertino.dart';
import 'package:uirp/dataBase/leBicycle.dart';

import 'package:uirp/dataBase/InfoGetter2.dart';

class LeUser with ChangeNotifier{
  String email = "";
  String name = "";
  String surname = "";
  DateTime timeRegistration = DateTime.now();
  int balance = 0;
  List<LeBicycle> bicycles = [];
  // BorrowerTransactions transactions = [];

  void populateLeUserWithData(String email) async{
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
    var timestamp = myList["users"][0]["timeRegistration"];
    this.timeRegistration = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    this.balance = myList["users"][0]["balance"];
    print("Name is"+this.name);
  }

  LeUser(String email) {
    populateLeUserWithData(email);
  }
}