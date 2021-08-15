import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bodyBikeLendingHistory.dart';

/**
 * MAY NEED THESE REQUIRED VARIABLES:
 * - History of the bike lending.
 * - User's profile.
 */

class BikeLendingHistoryPage extends StatelessWidget {
  final int id;
  BikeLendingHistoryPage({
      Key? key,
        required this.id,
      }): super(key:key);
  @override
  Widget build(BuildContext context) {
    print("in bikeLendingHistoryPage " + this.id.runtimeType.toString());
    return BodyBikeLendingHistory(
      id: this.id,
    );
  }
}