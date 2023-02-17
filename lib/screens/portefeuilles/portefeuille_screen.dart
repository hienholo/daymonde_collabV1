
import 'dart:convert';
import 'package:daymonde_collaboration/models/retrait_model.dart';
import 'package:http/http.dart' as http;

import 'package:daymonde_collaboration/components/fournisseur/portefeuille/recus.dart';
import 'package:daymonde_collaboration/components/fournisseur/portefeuille/retire.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/screens/portefeuilles/demande_retrait_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/color.dart';

class PortefeuilleFournisseurScreen extends StatefulWidget {
  const PortefeuilleFournisseurScreen({Key? key}) : super(key: key);

  @override
  State<PortefeuilleFournisseurScreen> createState() => _PortefeuilleFournisseurScreenState();
}

class _PortefeuilleFournisseurScreenState extends State<PortefeuilleFournisseurScreen> {
  String ? soldeTotal;
  balanceAndSoldTotal() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    int user_id = pre.getInt('userId') ?? 0;
    String myUrl = "$getBalanceURL?user_id=${user_id}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse['balancetotal']);
      ////////////// SET DATA IN SESSION ////////
      pre.setString('soldeTotal', '${jsonResponse['balancetotal']['somme']}');
    } else {
      throw Exception('Failed to load album');
    }
  }
  void loadPortefeuilleInfo() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      soldeTotal = pre.getString('soldeTotal');
    });
  }
  Future<List<RetraitModel>> getAllRetaits() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int user_id = pref.getInt('userId') ?? 0;
    String myUrl = "$getAllRetraits?user_id=${user_id}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse['transaction']);
      var data = jsonResponse['transaction'].cast<Map<String, dynamic>>();
      setState(() {
        soldeTotal = pref.getString('soldeTotal');
      });
      return data.map<RetraitModel>((json) => RetraitModel.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  late Future<List<RetraitModel>> futureRetrait;
  @override
  void initState() {
    // TODO: implement initState
    balanceAndSoldTotal();
    loadPortefeuilleInfo();
    futureRetrait = getAllRetaits();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(1, 22, 103, 10),
          toolbarHeight: 90,
          leading:  IconButton(
            tooltip: 'Previous choice',
            icon:  Image.asset('assets/images/portefeuille.png',width: 100,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset('assets/images/DDD.png',width: 100),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FournisseurPortefeuilleRetraitScreen()));
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(200.0),
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Container(
                child: Column(
                  children: [
                    FutureBuilder<List<RetraitModel>>(
                      future: futureRetrait,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.only(bottom: 30),
                                child: Text('${soldeTotal}',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6,),
                                child: Text('CFA',style: TextStyle(color: Colors.white,fontSize: 16),),
                              )
                            ],
                          );
                        } else {
                          return Center(child:Container());
                        }
                      },
                    ),
                    Container(
                      color: Colors.white,
                      height: 60,
                      child: TabBar(
                        labelColor: Color.fromRGBO(1, 22, 103, 70),
                        unselectedLabelColor: Colors.black54,
                        indicatorColor: Colors.blue,
                        tabs: [
                          Tab(icon: Text('Réçu',style: TextStyle(color: Colors.black,fontSize: 16),)),
                          Tab(icon: Text('Retirer',style: TextStyle(color: Colors.black,fontSize: 16)))
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 5,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('Votre demande de retrait est en cours de traitement ...'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5,bottom: 10),
                              child: Text('Montant à retirer: 40. 000 Fcfa',style: TextStyle(color: blue,fontSize: 16),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
            children: [
              FournisseurRecuWidget(),
              FournisseurRetraitWidget(),
            ]
        ),
      ),
    );
  }
}











