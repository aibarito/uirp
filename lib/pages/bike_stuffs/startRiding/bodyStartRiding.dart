import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

import 'backgroundStartRiding.dart';

var debugDecor = BoxDecoration(
  border: Border.all(color: Colors.green),
);
const DungnTextStyle = TextStyle(color: Colors.white);
int _start = 10;
int _current = 10;

class BodyStartRiding extends StatefulWidget {
  const BodyStartRiding({Key? key}) : super(key: key);

  @override
  _BodyStartRidingState createState() => _BodyStartRidingState();
}

class _BodyStartRidingState extends State<BodyStartRiding> {

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() { _current = _start - duration.elapsed.inSeconds; });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size sizeParent = MediaQuery.of(context).size;
    return backgroundStartRiding(
      child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Center(
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: Text("start"),
                  ),
                  Text("$_current")
                ],
              ),
            );
          }),
    );
  }
}
