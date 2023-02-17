// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'dart:async';
import 'dart:ui';
import 'dart:convert';
import 'package:daymonde_collaboration/components/profile/BottomTabbarCompteFournisseur.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:http/http.dart' as http;

import 'package:daymonde_collaboration/components/profile/BottomTabbarCompteVendeur.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/userData.dart';
import 'package:daymonde_collaboration/screens/recruteur/ProfileScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/infomation/information_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsRecruteur extends StatefulWidget {
  const SettingsRecruteur({Key? key}) : super(key: key);

  @override
  State<SettingsRecruteur> createState() => _SettingsRecruteurState();
}

class _SettingsRecruteurState extends State<SettingsRecruteur> {
  @override
  String Temps ="";
  String? name;
  String? prenom;
double _doubleYourTime =   TimeOfDay(hour: 12, minute: 59).hour.toDouble() + ( TimeOfDay(hour: 12, minute: 59).minute.toDouble() / 60);
double _doubleNowTime = TimeOfDay.now().hour.toDouble() + (TimeOfDay.now().minute.toDouble() / 60);
String CompteIdex = "compte_vendeur";
  Future<bool> changer_compte(String key,String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(key,value);
  }
  Future<String> getCompteIndex() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    CompteIdex = pref.getString('select_compte')!;
    setState(() {
      CompteIdex;
    });
    return CompteIdex;
  }
  getUserDetails() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    int id_recruteur = pre.getInt('userId') ?? 0;
    String myUrl = "$userDetailURL?id_user=${id_recruteur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['recruteur_infos'];
      print(jsonResponse);
      ////////////// SET DATA IN SESSION ////////
      pre.setString('name', jsonResponse['name']);
      pre.setString('prenom', jsonResponse['prenom']);

    } else {
      throw Exception('Failed to load album');
    }
  }
  void loadInfo() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      name = pre.getString('name');
      prenom = pre.getString('prenom');
    });
  }
 initState(){
      getCompteIndex();
      getUserDetails();
      loadInfo();
      if (_doubleYourTime-_doubleNowTime>0) {
        setState(() {
          Temps='Bonjour';
        });
      }
      else{
        setState(() {
          Temps="Bonsoir";
        });
      }
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
        primary: true,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top:8.0,bottom: 30,left: 20,right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Temps.toString(),style: TextStyle(color: Color.fromARGB(213, 77, 61, 61),fontSize: 35,fontWeight: FontWeight.bold),),
                           Text('${name} ${prenom}',style: TextStyle( color: black,fontSize: 16,fontWeight: FontWeight.bold),),
                        ],

                      ),
                       CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(users[users.length-1].profilImage),
                          ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => Padding(
                            padding:
                            EdgeInsets.only(bottom: size.height * 0.64),
                            child: Dialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(16.0))),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('Changer de compte',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: 100,
                                          child: Divider(color: Colors.grey,thickness: 2,),
                                        )
                                      ],
                                    ),
                                  ),
                                  CompteIdex == 'compte_vendeur' ? ListTile(
                                    title:  Text('Compte vendeur',style: TextStyle(color:  blue),),
                                    trailing: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text( 'Actifs',style: TextStyle(color: blue,fontWeight: FontWeight.bold),),
                                    ),
                                  ) : Container(),
                                  CompteIdex == 'compte_founisseur' ? ListTile(
                                    title:  Text('Compte founisseur',style: TextStyle(color: blue),),
                                    trailing: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),

                                      ),
                                      child: Text('Actifs',style: TextStyle(color: blue,fontWeight: FontWeight.bold),),
                                    ),
                                  ) : Container(),
                                  CompteIdex == 'compte_vendeur' ? Container() : ListTile(
                                    onTap: ()  {
                                      Navigator.pop(context);
                                      showAlertDialog(context);
                                      new Timer(const Duration(seconds: 5), () {
                                        setState(() async {
                                          Navigator.pop(context);
                                          changer_compte('select_compte','compte_vendeur');
                                          SharedPreferences pref = await SharedPreferences.getInstance();
                                          CompteIdex = pref.getString('select_compte')!;
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>ProfileScreen()));
                                        });
                                      });
                                    },
                                    title:  Text('Compte vendeur',style: TextStyle(color: CompteIdex == 'compte_vendeur' ? blue: Colors.black),),
                                    trailing: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: blue)
                                      ),
                                      child: Text('Activer',style: TextStyle(color: blue,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  CompteIdex == 'compte_founisseur' ? Container() :ListTile(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      showAlertDialog(context);
                                      changer_compte('select_compte','compte_founisseur');
                                      SharedPreferences pref = await SharedPreferences.getInstance();
                                      CompteIdex = pref.getString('select_compte')!;
                                      new Timer(const Duration(seconds: 5), () {
                                        setState(() async {
                                          CompteIdex;
                                          Navigator.pop(context);
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>ProfileScreen()));
                                        });
                                      });
                                    },
                                    title:  Text('Compte founisseur', style: TextStyle(color: CompteIdex == 'compte_founisseur' ? blue: Colors.black),),
                                    trailing: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color:  blue)
                                      ),
                                      child: Text('Activer',style: TextStyle(color: blue,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Changer de compte',style: TextStyle(color: blue,fontSize: 14,fontWeight: FontWeight.bold),),
                          Icon(Icons.expand_more_outlined)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ), ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child:Column(
                    children: [
                      Column(
                        children: [
                         GestureDetector(
                          onTap: (() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>InformationScreen()));
                          }),
                           child: ListTile(
                                title: const Text("Plus d'informations"),
                                leading: Icon(Icons.info_outline)
                           ),
                           
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left:60.0),
                           child: Divider(thickness: 2,),
                         ),
                          GestureDetector(
                          onTap: (() {
                            Navigator.pushNamed(context,'BadgeCertifie');
                          }),
                           child: ListTile(
                                title: const Text("Obtenir un badge certifié"),
                                leading:Image.asset('assets/images/badge-CERTIFIER 1.png',width: 20,)
                           ),
                           
                         ),
                          Padding(
                           padding: const EdgeInsets.only(left:60.0),
                           child: Divider(thickness: 2,),
                         ),
                          GestureDetector(
                          onTap: (() {
                            Navigator.pushNamed(context,'CentreAssistant');
                          }),
                           child: ListTile(
                                title: const Text("Centre d'assistance"),
                                leading: ImageIcon(
                                  color:blue,
                                   AssetImage('assets/images/live-chat.png',)
                                  ,)
                           ),
                           
                         ),
                         
                        ]
                        ),
                    ],
                  ),
                  ),
                  SizedBox(height: 15,),
                    Container(
                    color: Colors.white,
                    child:  GestureDetector(
                  onTap: (() {
                    Navigator.pushNamed(context,'ConditionUsing');
                  }),
                   child: ListTile(
                        title: const Text("Conditions d'utilisation"),
                        leading: ImageIcon(
                                   AssetImage('assets/images/clipboard.png')
                                  ,)
                   ),
                   
                 ),
                  )
              ],
            ),
          ) ,
        ),
      ),
      bottomNavigationBar:  SizedBox(
        height: 57,
        child: SizedBox(
          child: Column(
            children: [
              CompteIdex == 'compte_vendeur' ?
              BottomTabbarCompteVendeur(selectedIndex: 0)
                  :
              ProfilBottomCompteFournisseur(selectedIndex: 0),
            ],
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(color: blue,),
        Container(margin: EdgeInsets.only(left: 5),child:Text(" Changement en cours", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}