import 'package:daymonde_collaboration/screens/fournisseur/notification/Alerte_daymond_screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/Modifocation_Daymond_screen.dart';
import 'package:flutter/material.dart';

class NotificationPageScreen extends StatefulWidget {
  const NotificationPageScreen({super.key});

  @override
  State<NotificationPageScreen> createState() => _NotificationPageScreenState();
}

class _NotificationPageScreenState extends State<NotificationPageScreen> {
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
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              //
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                'assets/images/basket.png',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      children: const [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "STOCK EPUISÉ",
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
                                            "Vous avez marqué ce produit stock epuisé....",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(top: 40.0),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "Aujourd'hui 13:17",
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                'assets/images/ecouter.png',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      children: const [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "RGIE DAYMOND",
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
                                            "Votre mission a été effectuée avec succes....",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(top: 40.0),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "Hier 10/04",
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ModificationDaymondScreen(),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                'assets/images/Image4.png',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      children: const [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("MODIFICATION DAYMOND",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Daymond a modifié les informationsde ce produit",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(top: 40.0),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "13 Mai 07:24",
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlerteDaymondScreen(),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                'assets/images/MISSION.png',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: const [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "STOCK EPUISÉ",
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
                                          "Nous avons besoins d'un produit",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          'assets/images/desktop.png',
                                          width: 50,
                                          height: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

