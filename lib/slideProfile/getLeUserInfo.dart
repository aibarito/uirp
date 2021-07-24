
import 'package:uirp/dataBase/leUser.dart';

LeUser getLeUserInfo() {
 /*
  Do actual solidity work here.
  */
  /* Demo only: */
  Map<String, dynamic> userMap =
  {
    "name": "Le Putintin",
    "email":"putin@unist.ac.kr"
  };
  return LeUser.fromJson(userMap);
}