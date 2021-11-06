import 'dart:math';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/AllBicycleInfo.dart';
import 'package:uirp/dataBase/InfoGetter2.dart';
import 'package:uirp/dataBase/leBicycle.dart';
import 'package:uirp/dataBase/leUser.dart';
import './bicycleCardButton.dart';
import 'package:uirp/pages/bike_stuffs/bike_lending_history/bikeLendingHistoryPage.dart';
import 'package:uirp/pages/bike_stuffs/bike_manager/backgroundBikeManager.dart';
import 'package:uirp/dataBase/BlockchainIntegration.dart';

import 'QrPopUpCard.dart';
import 'dialogRoute.dart';

const DungnTextStyle = TextStyle(fontSize: 20, color: Colors.white);

class BodyBikeManager extends StatefulWidget {
  BodyBikeManager({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;
  @override
  _BodyBikeManagerState createState() => _BodyBikeManagerState();
}

class _BodyBikeManagerState extends State<BodyBikeManager> {

  var _streamController = StreamController<List<LeBicycle>>();



  List<Widget> displayBicycleList(List<LeBicycle> bicycleList) {
    Size size = MediaQuery.of(context).size;
    var res = <Widget>[];
    for (int i = 0; i < bicycleList.length; ++i) {
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
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Time traveled: ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              bicycleList[i].timeRegistration.toString() +
                                  " (hours)",
                              style: TextStyle(
                                color: Colors.yellowAccent,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Amount Earned ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              bicycleList[i].amountEarned.toString() +
                                  " (coin)",
                              style: TextStyle(
                                color: Colors.yellowAccent,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Image.asset(
              "assets/images/bicycle.png",
              width: size.width * 0.7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return BikeLendingHistoryPage(id: bicycleList[i].bicycle_id);
                          }));
                    },
                    child: Text("Transaction history"),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.green))),
              ],
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child:
                  const Text('remove', style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    setState(() {
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



















  // Succeeding pages should display 3 more items from the List
  void loadMoreBikes(bool increment) async {
    print("10. At least I entered the loadMoreBiked with bool"+increment.toString());
    String bikeid = await Provider.of<BlockchainIntegration>(context, listen: false).NewBicycle();
    print("8. New Bikeid is" + bikeid);
    fetchBicycles()
        .then((response) {
      _streamController.add(response);
      print("9. The amount of bikes is: "+response.length.toString());
    });
        setState(() {
    });
  }

  // Call to fetch images
  loadBikes(bool refresh) {
    fetchBicycles()
        .then((response) {
        _streamController.add(response);
        print("1. The amount of bikes is: "+response.length.toString());
        }
        );

    if (refresh) loadMoreBikes(refresh); // refresh whole List
  }

  @override
  void initState() {
    super.initState();
    loadBikes(false);
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  var _listCursorEnd = 21;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: _streamController.stream,
      builder: (BuildContext context, AsyncSnapshot<List<LeBicycle>> snapshot) {
        if (snapshot.hasData) {
          // This ensures that the cursor won't exceed List<Album> length
          if (_listCursorEnd > snapshot.data!.length)
            _listCursorEnd = snapshot.data!.length;
          debugPrint('Stream snapshot contains ${snapshot.data!.length} item/s');
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Wohoo"),
          ),
          body: Center(
            child: snapshot.hasData
                  ? BackGroundBikeManager(
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
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Column(
                          children: displayBicycleList(snapshot.data!),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(30.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Colors.lightGreen,
                          ),
                          child: const Text('Add 1 more bike', style: DungnTextStyle),
                          onPressed: () {
                                loadBikes(true);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
                  : TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(30.0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.lightGreen,
              ),
              child: const Text('Add 1 more bike', style: DungnTextStyle),
              onPressed: () {
                loadBikes(true);
              },
            )
            ),

        );
      },
    );
  }

  Future<List<LeBicycle>> fetchBicycles() async {
    List<LeBicycle> listy = [];
    var email = Provider.of<BlockchainIntegration>(context, listen: false).getEmail();
    print("2. The email of the user is: " + email.toString());
    InfoGetter2 info = new InfoGetter2();
    print("3. Id of the LeUser is" + email);
    String query = '''
        {
          users(where:{email: "$email"}) {
            bicycles{
              id
              owner {
              id
              name}
              timeRegistration
              amountEarned
              transactionHistory
            }
          }
        }
          ''';
    Map<String, dynamic> myList = await info.get2(query);
    var bicyclesList = myList["users"][0]["bicycles"];
    print("5. Printing the bicycles List");
    print(bicyclesList);
    for (var i = 0; i < bicyclesList.length; i ++) {
      var bike = new LeBicycle();
      bike.bicycle_id = bicyclesList[i]["id"].toString();
      bike.name = bicyclesList[i]["owner"]["name"].toString();
      var timestamp = int.parse(bicyclesList[i]["timeRegistration"]);
      bike.timeRegistration = DateTime.fromMillisecondsSinceEpoch(timestamp);
      bike.amountEarned = 0;
      listy.add(bike);
      print("4. The id of the bicycle is: "+bike.bicycle_id);
    }
    return listy;
  }
}

