
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/leUser.dart';
import './InfoGetter2.dart';
import './BlockchainIntegration.dart';


Future<LeUser> getLeUserInfo(context) async{

  InfoGetter2 info = new InfoGetter2();
  String email = BlockchainIntegration().getEmail();
  print("Email is" + email);
  String query = '''
{
  users(where:{email: "$email"}) {
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
    "email": myList["users"][0]["email"]
  };
  LeUser x = LeUser.fromJson(userMap);
  print("Name is"+x.name);
  return x;
}
