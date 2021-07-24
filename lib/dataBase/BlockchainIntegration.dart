import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import "dart:io";
import'dart:math';//Random
import'dart:typed_data';//Uint8List
import'package:web3dart/crypto.dart';

import 'package:web3dart/web3dart.dart' as _i1;
import './Everything.g.dart';


class BlockchainIntegration {
  // Making it a singleton
  static final BlockchainIntegration _singleton = BlockchainIntegration._internal();

  factory BlockchainIntegration() {
    return _singleton;
  }

  BlockchainIntegration._internal();

  static const String rpcUrl = 'https://ropsten.infura.io/v3/f0bfb8e77bc548f5b2b5ca71b4f86953';
  static const String wsUrl = 'wss://ropsten.infura.io/ws/v3/f0bfb8e77bc548f5b2b5ca71b4f86953';

  static const String privateKey =
      '7ae4495b934af72e8ce1d5792f98c119f1d831690ee27dcfeee4c077d7f4f7b3';

  final EthereumAddress contractAddr =
  EthereumAddress.fromHex('0xC2C762f92EbC7ca0DeB11d70df87aF431C12C1e3');
  final EthereumAddress receiver =
  EthereumAddress.fromHex('0x070aE2b66a63De8b4Cd352e725CA81Ed663611F0');

  final client = Web3Client(rpcUrl, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(wsUrl).cast<String>();
  });

  Future<String> SignUp(String _name, String _surname, String _password, String _id, String _email) async {
    String password = _email + _password;
    // Or generate a new key randomly
    var rng = new Random.secure();
    EthPrivateKey credentials = EthPrivateKey.createRandom(rng);

    var address = await credentials.extractAddress();
    print(address.hex);

    Wallet wallet = await Wallet.createNew(credentials, password, rng);
    // print(wallet.toJson());
    String pathway = "/data/user/0/com.example.uirp/app_flutter/dir";

    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    new Directory(appDocDirectory.path+'/'+'dir').create(recursive: true).then((Directory directory) {
      print('Path of New Dir: '+ directory.path);
      pathway = directory.path;
    });
    var file = new File(pathway+'/file.txt');
    var sink = file.openWrite();
    sink.write(wallet.toJson());

    // Close the IOSink to free system resources.
    sink.close();

    final everything = await Everything(address: contractAddr, client: client);

    final genesis_credentials = await client.credentialsFromPrivateKey(privateKey);
    final genesis_ownAddress = await genesis_credentials.extractAddress();

    await everything.enrollUser(_name, _surname, BigInt.from(int.parse(_id)), address, true, credentials: genesis_credentials);
    print(wallet.toJson());
    await client.dispose();
    return "Ding";
  }

  void LogIn(String _username, String _password) async {
    String password = _username + _password;
    late Wallet wallet;

    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    String pathway =  "/data/user/0/com.example.uirp/app_flutter/dir";
    new Directory(appDocDirectory.path+'/'+'dir').create(recursive: true)
// The created directory is returned as a Future.
        .then((Directory directory) {
      print('Path of New Dir: '+ directory.path);
      pathway = directory.path;
    });

    File file = File(pathway); // (1)
    Future<String> futureContent = file.readAsString();

    futureContent.then((c) => wallet = Wallet.fromJson(c, password));
  }


}