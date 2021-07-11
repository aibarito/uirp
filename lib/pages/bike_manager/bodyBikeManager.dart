import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uirp/dataBase/leBicycle.dart';
import 'package:uirp/main.dart';
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
var bicycleList = <LeBicycle>[];

class _BodyBikeManagerState extends State<BodyBikeManager> {

  List<Widget> displayBicycleList() {
    var res = <Widget>[];
    for(int i = 0; i < bicycleList.length; ++i) {
      res.add(Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: bicycleList[i].name,
                  border: InputBorder.none),
              onChanged: (text) {
                bicycleList[i].name = text;
                //print('just change text field: $text');
              }
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
    return sideProfile(
        data: demoUser,
        child: BackGroundBikeManager(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              // Title
              new Padding(padding: const EdgeInsets.only(
                  top: 10.00, left: 10.00),
                child: new Text("Demo title", style: DungnTextStyle),
              ),
              // content
              new Container(
                child: new Text("Demo list", style: DungnTextStyle),
              ),
              // Comments List will go here
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
                        Random rnd = new Random(42);
                        Map<String, dynamic> jsonNew = {
                          "id":bicycleList.length + 1,
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
        ),
    );
  }
}




