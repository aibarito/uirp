
import 'package:uirp/dataBase/leUser.dart';
import './InfoGetter2.dart';
import './BlockchainIntegration.dart';


Future<LeUser> getLeUserInfo() async{
  /*
 * must get user info right after sign-in.
 */
  /* Demo only: */
  InfoGetter2 info = new InfoGetter2();

  String email = BlockchainIntegration().getEmail();
  print(email);
  String query = r'''
{
  users(where:{email:"ollie041114@gmail.com\t"}) {
    id
    __typename
    name
    email 
    timeRegistration
  }
}

  ''';
  Map<String, dynamic> myList = await info.get2(query);
  print(myList);
  print(myList['users']);
  print(myList["users"][0]["email"]);

  Map<String, dynamic> userMap =
  {
    "name": myList["users"][0]["name"],
    "email": myList["users"][0]["email"]
  };
  LeUser x = LeUser.fromJson(userMap);
  print("Name is"+x.name);
  return x;
}
