import 'package:daymonde_collaboration/screens/fournisseur/add_produits/Add_produit_enGros1_Screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/add_produits/Add_produit_unitaire_Screen.dart';
import 'package:flutter/material.dart';

class AlerteDaymondScreen extends StatefulWidget {
  const AlerteDaymondScreen({super.key});

  @override
  State<AlerteDaymondScreen> createState() => _AlerteDaymondScreenState();
}

class _AlerteDaymondScreenState extends State<AlerteDaymondScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width < 320
        ? 9
        : size.width == 320
            ? 11
            : 15;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 223, 223),
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {},
                child: Image.asset('assets/images/MISSION-1.png')),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: RichText(
                text: const TextSpan(
                  text: "ALERTE DAYMOND\n",
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: "En cours",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.delete,
                size: 26.0,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.share_sharp),
              )),
        ],
        actionsIconTheme:
            const IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
      ),
      //
      //
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.only(top: 30, bottom: 15, left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26),
              ),
              child: Column(
                children: [
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Bonjour monsieur",
                        style:
                            TextStyle(color: Colors.black, fontSize: fontsize),
                        children: const <TextSpan>[
                          TextSpan(
                              text: " MICHAEL KOUAME, DAYMOND\n",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  "a besoin d'un fournisseur d'ordinateur bureaux\ndual core 17 pouces")
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 4, bottom: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Images similaire")),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, left: 6),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black26),
                            ),
                            child: Image.asset(
                              'assets/images/PC.png',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, left: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black26),
                            ),
                            child: Image.asset(
                              'assets/images/PC.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 6, bottom: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: "Fin de mission :",
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: " Afficharge du compte a reboot",
                                style: TextStyle(
                                    color: Colors.red, fontSize: fontsize)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 10, bottom: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 12, 57, 238),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              constraints: const BoxConstraints(),
                              context: context,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              builder: (context) {
                                return Container(
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 6),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, top: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 90, right: 50),
                                              child: Container(
                                                height: 3,
                                                width: 40,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  Positioned(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Icon(
                                                        Icons.clear_rounded,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text("Choisir le type de vente"),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                              color: Colors.black12,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          elevation: 1,
                                          margin: const EdgeInsets.only(
                                              top: 20,
                                              left: 8,
                                              right: 8,
                                              bottom: 8),
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.radio_button_checked,
                                              color: Colors.orange,
                                            ),
                                            title: const Text('Vente unitaire'),
                                            trailing:
                                                const Icon(Icons.chevron_right),
                                              onTap: ()=> Navigator.push(context,
                                                  MaterialPageRoute(builder: (context)=>AjoutprodruitRecruUnitaireScreen())),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                              color: Colors.black12,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          elevation: 1,
                                          margin: const EdgeInsets.only(
                                              top: 6,
                                              left: 8,
                                              right: 8,
                                              bottom: 40),
                                          child: ListTile(
                                            leading: const Icon(
                                                Icons.radio_button_checked),
                                            title: const Text('Vent en gros'),
                                            trailing:
                                                const Icon(Icons.chevron_right),
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context)=>AjoutprodruitenRecuGrosScreen()));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                     
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Proposer un produit",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text("je n'est pas ce produit"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
