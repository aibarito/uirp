
import 'package:uirp/dataBase/leUser.dart';
import './InfoGetter2.dart';
import './BlockchainIntegration.dart';

Future<LeUser> getLeUserInfo() async{
 /*
 * must get user info right after sign-in.
 */
  /* Demo only: */
  InfoGetter2 info = new InfoGetter2();
  BlockchainIntegration solidity = new BlockchainIntegration();
  var email = solidity.getEmail();
  String query = r'''
{
  users(where:{email: '''+email.toString()+ r'''{
    id
    email
    name
  }
}
  ''';
  List<dynamic> myList = await info.get2(query);
  print(myList);
  print(myList[0]);
  print(myList[0]['users']);
  Map<String, dynamic> userMap =
  {
    "name": myList[0]["users"]["name"],
    "email": myList[0]["users"]["email"]
  };
  LeUser x = LeUser.fromJson(userMap);
  return x;
}