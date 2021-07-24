

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import "dart:io";
import'dart:math';//Random
import'dart:typed_data';//Uint8List
import'package:web3dart/crypto.dart';

import 'package:web3dart/web3dart.dart' as _i1;
import 'Everything.g.dart';


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/leUser.dart';

import 'package:uirp/pages/main_page/mainPage.dart';
import 'package:uirp/providers/balance.dart';


const String rpcUrl = 'https://ropsten.infura.io/v3/f0bfb8e77bc548f5b2b5ca71b4f86953';
const String wsUrl = 'wss://ropsten.infura.io/ws/v3/f0bfb8e77bc548f5b2b5ca71b4f86953';

const String privateKey =
    '7ae4495b934af72e8ce1d5792f98c119f1d831690ee27dcfeee4c077d7f4f7b3';

final EthereumAddress contractAddr =
EthereumAddress.fromHex('0xC2C762f92EbC7ca0DeB11d70df87aF431C12C1e3');
final EthereumAddress receiver =
EthereumAddress.fromHex('0x070aE2b66a63De8b4Cd352e725CA81Ed663611F0');

late final client;
late final ethClient;
//TODO: make _login = true after successfully signin
bool _globalLogin = true;
bool checkIfLogin() {
  return _globalLogin;
}
void setLogin(bool val) {
  _globalLogin = val;
}

void main() {
  // establish a connection to the ethereum rpc node. The socketConnector
  // property allows more efficient event streams over websocket instead of
  // http-polls. However, the socketConnector property is experimental.
  client = Web3Client(rpcUrl, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(wsUrl).cast<String>();
  });

  SignUp('ollie041114@gmail.com', '12345678910');
  //LogIn('ollie041114@gmail.com', '12345678910');
  runApp(MyApp());
}


Future<String> SignUp(String _username, String _password) async {
  String password = _username + _password;
  // Or generate a new key randomly
  var rng = new Random.secure();
  EthPrivateKey credentials = EthPrivateKey.createRandom(rng);

  var address = await credentials.extractAddress();
  print(address.hex);

  Wallet wallet = await Wallet.createNew(credentials, password, rng);
  // print(wallet.toJson());
 // var file = File('file.txt');
 // var sink = file.openWrite();
 // sink.write(wallet.toJson());

  // Close the IOSink to free system resources.
  //sink.close();

  final everything = await Everything(address: contractAddr, client: client);

  final genesis_credentials = await client.credentialsFromPrivateKey(privateKey);
  final genesis_ownAddress = await genesis_credentials.extractAddress();

  await everything.enrollUser("Olzhas", "Yessenbayev", BigInt.from(20182027), address, true, credentials: genesis_credentials);
  print(wallet.toJson());
  await client.dispose();
  return "Ding";
}

void LogIn(String _username, String _password) async {
  String password = _username + _password;
  late Wallet wallet;
  File file = new File('./file.txt'); // (1)
  Future<String> futureContent = file.readAsString();

  futureContent.then((c) => wallet = Wallet.fromJson(c, password));
}

/*
Example of what an user should look like:
 */

Map<String, dynamic> userMap = {"name": "Le Putintin",
  "email":"putin@unist.ac.kr"};
//jsonDecode("{\"name\":\"Le Putintin\", \"email\":\"putin@unist.ac.kr\"}");
LeUser demoUser = LeUser.fromJson(userMap);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => Balance()),
            ChangeNotifierProvider(create: (context) => LeUser())
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              // scaffoldBackgroundColor: Colors.blue[10],
            ),
            home: MainPage(),
          )
      );
  }
}
