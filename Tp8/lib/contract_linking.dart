import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
  // 1. Variables de configuration réseau
  // Si tu utilises l'émulateur Android, utilise 10.0.2.2.
  // Si tu utilises le Web ou iOS, utilise 127.0.0.1.
  final String _rpcUrl = "http://127.0.0.1:7545";
  final String _wsUrl = "ws://127.0.0.1:7545/";
  
  // 2. TA CLÉ PRIVÉE (Copie-colle celle de Ganache ici !)
  final String _privateKey = "0x8e19320891b34291aa179c80a3ad3ed7fd51bf5f1e3ed98f680a25b450a740a7";

  // 3. Variables Web3
  late Web3Client _client;
  bool isLoading = true;

  late String _abiCode;
  late EthereumAddress _contractAddress;
  late Credentials _credentials;
  late DeployedContract _contract;
  late ContractFunction _yourName;
  late ContractFunction _setName;

  late String deployedName;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {
    // Établir la connexion au nœud RPC (Ganache)
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    // Lecture du fichier JSON généré par Truffle
    String abiStringFile = await rootBundle.loadString("src/artifacts/HelloWorld.json");
    var jsonAbi = jsonDecode(abiStringFile);
    
    _abiCode = jsonEncode(jsonAbi["abi"]);
    // Récupération de l'adresse du contrat depuis le réseau 5777
    _contractAddress = EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }

  Future<void> getCredentials() async {
    _credentials = EthPrivateKey.fromHex(_privateKey);
  }

  Future<void> getDeployedContract() async {
    // Dire à Web3dart où est notre contrat et à quoi il ressemble
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "HelloWorld"), _contractAddress);

    // Extraction des fonctions
    _yourName = _contract.function("yourName");
    _setName = _contract.function("setName");
    
    await getName();
  }

  Future<void> getName() async {
    // Appel de la fonction "yourName" du contrat (Lecture seule)
    var currentName = await _client.call(
        contract: _contract, function: _yourName, params: []);
    
    deployedName = currentName[0];
    isLoading = false;
    notifyListeners();
  }

  Future<void> setName(String nameToSet) async {
    // Appel de la fonction "setName" (Écriture = Transaction)
    isLoading = true;
    notifyListeners();

    await _client.sendTransaction(
      _credentials,
      Transaction.callContract(
        contract: _contract,
        function: _setName,
        parameters: [nameToSet],
      ),
    );
    
    await getName();
  }
}