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
            ListTile(
              leading: Icon(Icons.check),
              title: Text(bicycleList[i].name),
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('remove'),
                  onPressed: () {
                    setState( (){
                      bicycleList.removeAt(i);
                    });
                  },
                ),
                TextButton(
                  child: const Text('BTN2'),
                  onPressed: () {/* ... */},
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
                child: new Text("Text 1", style: DungnTextStyle),
              ),
              // content
              new Container(
                child: new Text("Text 2", style: DungnTextStyle),
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
                        bicycleList.add(demoLeBicycle);
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




