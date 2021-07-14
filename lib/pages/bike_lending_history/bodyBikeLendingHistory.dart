import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uirp/dataBase/bicycleList.dart';
import 'package:uirp/dataBase/demoTransaction.dart';
import 'backgroundbikeLendingHistory.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

const DungnTextStyle = TextStyle(fontSize: 20, color: Colors.white);

/**
 * DEMO ONLY
 */
List getTransactionHistory(int id) {
  List res = [];
  if (demoTransaction[id.toString()] != null) {
    return demoTransaction[id.toString()];
  }
  return res;
}

String findName(int id) {
  String res = "";
  for (int i = 0; i < bicycleList.length; ++i) {
    if (bicycleList[i].id == id) {
      return bicycleList[i].name;
    }
  }
  return res;
}

class BodyBikeLendingHistory extends StatelessWidget {
  final int id;
  BodyBikeLendingHistory({

        Key? key,
        required this.id,
      }): super(key:key);


  @override
  Widget build(BuildContext context) {
    print("in BodyBikeLendingHistory " + this.id.toString());
    Size size = MediaQuery.of(context).size;
    List hist = getTransactionHistory(this.id);
    print(hist[0]);
    // TODO: implement build
    return BackGroundBikeLendingHistory(
        child: Column(
      children: [
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          "for bike: " + findName(id),
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Column(
          children: displayHist(hist, context),
        )
      ],
    ));
  }
}

List<Widget> displayHist(List hist, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  var res = <Widget>[];
  for (int i = 0; i < hist.length; ++i) {
    var startDate = DateTime.parse(hist[i]["startDate"]);
    var endDate = DateTime.parse(hist[i]["endDate"]);
    var coin = hist[i]["coin"];
<<<<<<< HEAD
    double rating = 1.0 * hist[i]["rating"];
    var feedback = hist[i]["feedback"];
    res.add(Container(
        width: size.width,
        padding: const EdgeInsets.all(10),
        decoration: new BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        child: Column(
          children: [
            customLine("start: ", startDate.toString()),
            customLine("end: ", endDate.toString()),
            customLine("coin earned: ", coin.toString()),
            customLine("feedback: ", feedback.toString()),
            SizedBox(height: 10),
            RatingBarIndicator(
              rating: rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
=======
    double rating_ = 1.0*hist[i]["rating"];
    var feedback = hist[i]["feedback"];
    res.add(
        Container(
          width: size.width,
          padding: const EdgeInsets.all(10),
          decoration: new BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.all(Radius.circular(4.0))
          ),
          child: Column(
            children: [
              customLine("start: ", startDate.toString()),
              customLine("end: ", endDate.toString()),
              customLine("coin earned: ", coin.toString()),
              customLine("feedback: ", feedback.toString()),
              SizedBox(height:10),
              RatingBarIndicator(
                rating: rating_,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
>>>>>>> 88d0ff5cc6a13ef419930d2e7b9e27cc9e4b51f9
              ),
              itemCount: 5,
              itemSize: 30.0,
              direction: Axis.horizontal,
            ),
          ],
        )));
    res.add(
      SizedBox(height: 10),
    );
  }
  return res;
}

Widget customLine(String text1, String text2) {
  return Row(
    children: [
      Text(
        text1,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      Text(
        text2,
        style: TextStyle(color: Colors.yellowAccent, fontSize: 20),
      )
    ],
  );
}
