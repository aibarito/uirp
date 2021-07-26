
import 'package:uirp/dataBase/leUser.dart';

LeUser getLeUserInfo() {
 /*
 * must get user info right after sign-in.
 */
  /* Demo only: */
  Map<String, dynamic> userMap =
  {
    "name": "Le Putintin",
    "email":"putin@unist.ac.kr"
  };
  return LeUser.fromJson(userMap);
}