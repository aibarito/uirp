import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uirp/components/commentField.dart';
import 'package:uirp/pages/main_page/mainPage.dart';
import 'package:uirp/providers/balance.dart';
import 'backgroundStopRiding.dart';

var debugDecor = BoxDecoration(
  border: Border.all(color: Colors.green),
);
TextStyle DungnTextStyle(BoxConstraints constraints) {
  return TextStyle(
    color: Colors.white,
    fontSize: 0.05 * constraints.maxWidth,
  );
}

var geoLocator = Geolocator();
Future<Position> locatePosition() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return position;
}

class StopRidingPage extends StatelessWidget {
  Duration runTime;
  StopRidingPage({
    Key? key,
    required this.runTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizeParent = MediaQuery.of(context).size;
    print(runTime);

    Position currentPosition = Position(
        longitude: 0.0,
        latitude: 0.0,
        speedAccuracy: 0.0,
        altitude: 0.0,
        speed: 0.0,
        accuracy: 0.0,
        timestamp: null,
        heading: 0.0);
    locatePosition().then((position) {
      currentPosition = position;
    });
    var hours = runTime.inHours;
    var minutes = runTime.inMinutes - runTime.inHours * 60;
    var seconds =
        runTime.inSeconds - runTime.inHours * 3600 - runTime.inMinutes * 60;
    return Consumer<Balance>(builder: (context, balance, child) {
      return backgroundStopRiding(
        child: WillPopScope(
          onWillPop: () async => false,
          child: new LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: constraints.maxWidth * 0.3,
                ),
                Text("$hours hours\n$minutes minutes\n$seconds seconds",
                    style: DungnTextStyle(constraints)),
                SizedBox(
                  height: constraints.maxWidth * 0.1,
                ),
                Text("You have spend " + (seconds * 100).toString() + " won"),
                SizedBox(height: constraints.maxWidth * 0.1),
                Text("lattitude is: " +
                    currentPosition.latitude.toString() +
                    " longitude is: " +
                    currentPosition.longitude.toString()),
                ElevatedButton(
                  onPressed: () {
                    balance.decrement(seconds * 100);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MainPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "OK",
                    style: DungnTextStyle(constraints),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.all(constraints.maxWidth * 0.03)),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(12, 123, 141, 12))),
                ),
                SizedBox(
                  height: constraints.maxWidth * 0.07,
                ),
                Text(
                  "Comment for user",
                  style: DungnTextStyle(constraints),
                ),
                SizedBox(
                  height: constraints.maxWidth * 0.03,
                ),
                Material(
                    child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.wrap_text,
                        color: Colors.white10,
                      ),
                      hintText: "type here ...",
                      border: InputBorder.none),
                )),
                SizedBox(
                  height: constraints.maxWidth * 0.07,
                ),
                Text(
                  "Rating",
                  style: DungnTextStyle(constraints),
                ),
                SizedBox(
                  height: constraints.maxWidth * 0.03,
                ),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.white70,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}
