
import 'package:uirp/dataBase/leUser.dart';
import './InfoGetter2.dart';

Future<LeUser> getLeUserInfo() async{
 /*
 * must get user info right after sign-in.
 */
  /* Demo only: */
  InfoGetter2 info = new InfoGetter2();
  String query = r'''
  {
  users {
    name
    email
  }
  }
  ''';
  List<dynamic> myList = await info.get2(query);

  Map<String, dynamic> userMap =
  {
    "name": myList['user'],
    "email":"putin@unist.ac.kr"
  };
  LeUser x = LeUser.fromJson(userMap);
  return x;
}