import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/fournisseur_bottom_bar.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/notification_produit_screen.dart';
import 'package:flutter/material.dart';

class ModificationDaymondScreen extends StatefulWidget {
  const ModificationDaymondScreen({super.key});

  @override
  State<ModificationDaymondScreen> createState() =>
      _ModificationDaymondScreenState();
}

class _ModificationDaymondScreenState extends State<ModificationDaymondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 223, 223),
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                const Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 30,
                ),
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        border: Border.all(color: Colors.white, width: 1)),
                    child: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              ' Notification',
              style: TextStyle(color: Colors.black54, fontSize: 20),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: ()=>Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>NotificationProduitScreen())),
                child: const Icon(
                  Icons.info_outline,
                  size: 30.0,
                  color: Colors.blue,
                ),
              )),
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 2, right: 1),
                    child: RichText(
                      text: const TextSpan(
                        text:
                        "Daymond apporté des modification sur votre\narticle",
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: " Ordinateur portable pliable ....",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 1),
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                              color: Color.fromARGB(255, 219, 216, 216)),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                'assets/images/PC.png',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      children: const [
                                        Align(
                                          child: Text(
                                            "Ordinateur portable pliable dual\ncore,500 GB / 4 GB",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Affichage du sous titre ",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "76 000 FCFA",
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: RichText(
                      text: const TextSpan(
                        text:
                        "Merci d'accorder les modifications ou d'appeler pour\nplus d'informations",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        children: [],
                      ),
                    ),
                  ),
                  //elevatorbutton
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 12, 57, 238),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Appeler",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 12, 57, 238),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Accorder",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //close icone
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: Colors.black)

                          // boxShadow: const [
                          //   BoxShadow(
                          //       spreadRadius: 0.5,
                          //       blurRadius: 0.5,
                          //       offset: Offset(0.5, 0.5),
                          //       color: Colors.black),
                          // ],
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(Icons.clear_rounded),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
