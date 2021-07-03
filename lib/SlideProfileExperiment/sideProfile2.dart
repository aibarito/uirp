import '../leProfile.dart';
import '../leUser.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class sideProfile2 extends StatelessWidget {
  final String title;
  final leUser data;
  Widget? child;

  sideProfile2({
    Key? key,
    required this.title,
    required this.data,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
          child: this.child == null? Text('empty child in Scaffold') : child,
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
                child: leProfile(
                  user:data,
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Center(
                    child: Container (
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
                        )
                    ),
                  ),
                  SizedBox( width: size.width * 0.05,),
                  Text(
                    "My balance",
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
                    child: Container (
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
                        )
                    ),
                  ),
                  SizedBox( width: size.width * 0.05,),
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
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Center(
                    child: Container (
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
                        )
                    ),
                  ),
                  SizedBox( width: size.width * 0.05,),
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
                    child: Container (
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
                        )
                    ),
                  ),
                  SizedBox( width: size.width * 0.05,),
                  Text(
                    "Help",
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
                    child: Container (
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.settings_applications,
                          size: 27,
                          color: Colors.white,
                        )
                    ),
                  ),
                  SizedBox( width: size.width * 0.05,),
                  Text(
                    "Setting",
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
          ],
        ),
      ),
    );
  }
}