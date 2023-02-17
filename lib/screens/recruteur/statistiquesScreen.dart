import 'dart:convert';
import 'package:daymonde_collaboration/models/liste_fournisseur_model.dart';
import 'package:http/http.dart' as http;

import 'package:daymonde_collaboration/components/statistique/level.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Statistiques extends StatefulWidget {
  const Statistiques({Key? key}) : super(key: key);

  @override
  State<Statistiques> createState() => _StatistiquesState();
}

class _StatistiquesState extends State<Statistiques> {
  String ? niveau1;
  String ? niveau2;
  String ? niveau3;
  String ? niveau4;
  String ? niveau5;
  String ? solde_retire;
  String ? balancetotal;
  bool isLaoding = true;
  /////////////////////// get niveaux users ///////
  Future<void> getNiveauUsers() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    int id_recruteur = pre.getInt('userId') ?? 0;
    String myUrl = "$getNiveauURL?id_recruteur=${id_recruteur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      ////////////// SET DATA IN SESSION ////////
      setState(() {
        niveau1 = jsonResponse['somme_niveau1'].toString();
        niveau2 = jsonResponse['somme_niveau2'].toString();
        niveau3 = jsonResponse['somme_niveau3'].toString();
        niveau4 = jsonResponse['somme_niveau4'].toString();
        niveau5 = jsonResponse['somme_niveau5'].toString();
        isLaoding = false;
      });
    } else {
      throw Exception('Failed to load album');
    }
  }
  /////////////////////// GET BALANCE AND SOLD TOTAL ///////
  balanceAndSoldTotal() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    int user_id = pre.getInt('userId') ?? 0;
    String myUrl = "$getBalanceURL?user_id=${user_id}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      ////////////// SET DATA IN SESSION ////////
      setState(() {
        solde_retire = jsonResponse['solde_retire'].toString();
        balancetotal = jsonResponse['balancetotal']['solde_total_daymond'].toString();
        isLaoding = false;
      });
    } else {
      throw Exception('Failed to load album');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    getNiveauUsers();
    balanceAndSoldTotal();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bludeBold,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bludeBold,
        elevation: 0,
        title: Text(
          "Statistiques".toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: isLaoding ? Center(child: CircularProgressIndicator(),) :  Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: orange, width: 3),
              )),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Retiré",
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "${solde_retire} / ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${balancetotal}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Text(
                        "FCFA",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
              ),
              const Divider(
                thickness: 2,
                height: 2,
                color: Colors.white,
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding:  EdgeInsets.only(
                        top: 0.0, bottom: 20, left: 20, right: 20),
                    child: ListView(
                      children: [
                        LevelCard(
                            title: "Niveau 1",
                            levelNumber: '${niveau1}',
                            count_level:'1'
                        ),
                        LevelCard(
                            title: "Niveau 2",
                            levelNumber: '${niveau2}',
                            count_level:'2'
                        ),
                        LevelCard(
                            title: "Niveau 3",
                            levelNumber: '${niveau3}',
                            count_level:'3'
                        ),
                        LevelCard(
                            title: "Niveau 4",
                            levelNumber: '${niveau4}',
                            count_level:'4'
                        ),
                        LevelCard(
                            title: "Niveau 5",
                            levelNumber: '${niveau5}',
                            count_level:'5'
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
