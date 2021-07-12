import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uirp/dataBase/bicycleList.dart';
import 'package:uirp/dataBase/leBicycle.dart';
import 'package:uirp/main.dart';
import 'package:uirp/pages/bike_lending_history/bikeLendingHistoryPage.dart';
import 'package:uirp/pages/bike_manager/backgroundBikeManager.dart';
import 'package:uirp/slideProfile/sideProfile.dart';

class BodyBikeManager extends StatefulWidget {
  BodyBikeManager({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;
  @override
  _BodyBikeManagerState createState() => _BodyBikeManagerState();
}

const DungnTextStyle = TextStyle(fontSize: 20, color: Colors.white);
// should have a function that read all the available bicycles here.
//var bicycleList = <LeBicycle>[];

class _BodyBikeManagerState extends State<BodyBikeManager> {
  List<Widget> displayBicycleList() {
    var res = <Widget>[];
    for(int i = 0; i < bicycleList.length; ++i) {
      res.add(Card(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: bicycleList[i].name,
                  border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 20),
              onChanged: (text) {
                bicycleList[i].name = text;
                //print('just change text field: $text');
              },
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: new BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(4.0))
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Time traveled: ",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              bicycleList[i].timeTraveled.toString()+" (hours)",
                              style: TextStyle(color: Colors.yellowAccent,
                                  fontSize: 20),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Amount Earned ",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              bicycleList[i].amountEarned.toString()+" (coin)",
                              style: TextStyle(color: Colors.yellowAccent,
                                  fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 25,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return BikeLendingHistoryPage(
                            id: bicycleList[i].id
                          );
                        }));
                      },
                      child: Text("Transaction history"),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
                          backgroundColor: MaterialStateProperty.all(Colors.green))
                  ),
                ],
            ),

            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('remove',
                      style:TextStyle(color: Colors.red)),
                  onPressed: () {
                    setState( (){
                      bicycleList.removeAt(i);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundBikeManager(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          // Title
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "List of bicycles",
                style: TextStyle(fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              Column(
                children: displayBicycleList(),
              ),
              SizedBox(height: 10,),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(30.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Text('Add 1 more bike',  style: DungnTextStyle),
                onPressed: () {
                  setState( (){
                    Random rnd = new Random();
                    int id = (bicycleList.length) + 1;
                    Map<String, dynamic> jsonNew = {
                      "id":id,
                      "name":"bicycle#"+(bicycleList.length + 1).toString(),
                      "amountEarned":rnd.nextDouble() * (20-1),
                      "timeTraveled":rnd.nextInt(100),
                    };
                    bicycleList.add(new LeBicycle.fromJson(jsonNew));
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}




