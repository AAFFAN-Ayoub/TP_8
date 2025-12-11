import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp8/contract_linking.dart'; // Import correct pour ton projet

class HelloUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Récupération de l'objet de liaison (le "cerveau")
    var contractLink = Provider.of<ContractLinking>(context);

    TextEditingController yourNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World Dapp"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          // Si c'est en chargement, on affiche un rond qui tourne
          child: contractLink.isLoading
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Text(
                            contractLink.deployedName ?? "Unknown",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.cyan),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 29),
                        child: TextField(
                          controller: yourNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Your Name",
                              hintText: "What is your name?",
                              icon: Icon(Icons.drive_file_rename_outline)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                          ),
                          child: Text(
                            'Set Name',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onPressed: () {
                            // Appel de la fonction pour changer le nom sur la Blockchain
                            contractLink.setName(yourNameController.text);
                            yourNameController.clear();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}