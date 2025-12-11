import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp8/contract_linking.dart';
import 'package:tp8/helloUI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // On enveloppe toute l'application avec le Provider
    // Cela permet à HelloUI d'accéder aux données de la Blockchain
    return ChangeNotifierProvider<ContractLinking>(
      create: (_) => ContractLinking(),
      child: MaterialApp(
        title: "Hello World",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.cyan[400],
          useMaterial3: true,
        ),
        home: HelloUI(),
      ),
    );
  }
}