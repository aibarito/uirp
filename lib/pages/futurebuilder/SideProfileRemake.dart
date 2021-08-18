/**
 * Version 1.0: All the List views are very similar, will be moved to
 * component style soon.
 * To use this, call sideProfile(
    required-leUser variable,
    optional-Widget child
    )
 *
 * requried-leUser varible example:
 *  Map<String, dynamic> userMap = jsonDecode("{\"name\":\"Le Putintin\", \"email\":\"putin@unist.ac.kr\"}");
    var user = leUser.fromJson(userMap);
 */

import 'package:provider/provider.dart';
import 'package:uirp/slideProfile/leProfile.dart';
import 'package:uirp/pages/balance/myBalance.dart';
import 'package:uirp/pages/bike_stuffs/bike_manager/bikeManagerPage.dart';
import 'package:uirp/pages/main_page/mainPage.dart';

import '../../dataBase/leUser.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../dataBase/getLeUserInfo.dart';



class SideProfileRemake extends StatefulWidget {
  //const SideProfileRemake({Key? key}) : super(key: key);
  Widget? customChild;
  String? customText;
  SideProfileRemake ({
    Key? key,
    this.customChild,
    this.customText,
  }) : super(key: key);
  @override
  _SideProfileRemakeState createState() => _SideProfileRemakeState();
}

class _SideProfileRemakeState extends State<SideProfileRemake> {
  late Future<LeUser> _value;
  @override
  void initState(){
    super.initState();
    _value = getLeUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    print("The widget is being built!");
    return FutureBuilder<LeUser>(
      future: _value,
      builder: (
          BuildContext context,
          AsyncSnapshot<LeUser> snapshot,
          ) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return Consumer<LeUser>(
              builder: (context, leUser, child) {
                if(checkIfLogin() == true)
                {
                  print("The goddamn promise in LeUser");
                  leUser.name = snapshot.data!.name;
                  leUser.email = snapshot.data!.name;
                }
                return Scaffold(
                  appBar: AppBar(
                    title: Text("Stuff", style: TextStyle(color: Colors.white),),
                    backgroundColor: Colors.black,
                    elevation: 0.0,
                  ),
                  body: Center(
                    child: widget.customChild == null ? Text('empty child in Scaffold') : widget.customChild,
                  ),
                  drawer: Drawer(
                    child: ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        Container(
                          height: size.height * 0.2,
                          child: DrawerHeader(
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                            ),
                            child: LeProfile(
                              user: leUser,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.attach_money_rounded,
                                      size: 27,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              Text(
                                "My balance",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return MyBalance();
                            }));
                          },
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.directions_bike,
                                      size: 27,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              Text(
                                "History",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return BikeManagerPage();
                            }));
                          },
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.wallet_giftcard_rounded,
                                      size: 27,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              Text(
                                "Reward",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.help_sharp,
                                      size: 27,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              Text(
                                "Help",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.home,
                                      size: 27,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              Text(
                                "Main",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return MainPage();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );;
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}