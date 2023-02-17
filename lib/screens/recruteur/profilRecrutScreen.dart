// ignore: file_names
// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/screens/homeScreen.dart';
import 'package:daymonde_collaboration/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ProfilRecrut extends StatefulWidget {
  const ProfilRecrut({Key? key}) : super(key: key);

  @override
  State<ProfilRecrut> createState() => _ProfilRecrutState();
}

class _ProfilRecrutState extends State<ProfilRecrut> {
  DateTime now = DateTime.now();
  int? badge;
  String? name;
  String? prenom;
  String? contact;
  String? pays;
  String? ville;
  String? role_as;
  String? email;
  String? created_at;
  String? formatedDate;
  String? photo;

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
      pre.setString('contact', jsonResponse['contact']);
      pre.setString('pays', jsonResponse['pays']);
      pre.setString('ville', jsonResponse['ville']);
      pre.setString('role_as', jsonResponse['role_as']);
      pre.setString('email', jsonResponse['email']);
      pre.setString('created_at', jsonResponse['created_at']);
      pre.setString('photo', jsonResponse['photo']);

    } else {
      throw Exception('Failed to load album');
    }
  }
  void loadInfo() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      badge = pre.getInt('user_badge');
      /////////////// GET DATA IN SESSION /////////
      name = pre.getString('name');
      prenom = pre.getString('prenom');
      contact = pre.getString('contact');
      pays = pre.getString('pays');
      ville = pre.getString('ville');
      role_as = pre.getString('role_as');
      email = pre.getString('email');
      created_at = pre.getString('created_at');
      photo = pre.getString('photo');
      DateTime date = DateTime.parse(created_at!);
      var formatter = new DateFormat('EEEE d MMMM y', 'fr_FR');
       formatedDate = formatter.format(date);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getUserDetails();
    loadInfo();
    initializeDateFormatting('fr_FR', null).then((_) => now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          actionsIconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title:
              const Text('Mon profil', style: TextStyle(color: Colors.black)),
          actions: [
            PopupMenuButton(
                constraints: const BoxConstraints(minWidth: 150),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.pencil,
                              size: 12,
                            ),
                            const Text(
                              'Modifier',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          Logout().then((value) => {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                    (route) => false)
                              });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.powerOff,
                              size: 12,
                            ),
                            const Text('Déconnecter',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.trash,
                              size: 12,
                            ),
                            const Text('Supprimer',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                    ])
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width,
              decoration: const BoxDecoration(
                  color: bludeBold,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width < 350 ? size.width / 4 : size.width / 3,
                      height:
                      size.width < 350 ? size.width / 4 : size.width / 3,
                      decoration: BoxDecoration(
                          image:  DecorationImage(
                              image: photo == null ? NetworkImage('https://www.pngall.com/wp-content/uploads/12/Avatar-PNG-Images.png') : NetworkImage('${FILE_PATH_USER}/${photo}')
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(
                              width: size.width < 350 ? 2 : 4,
                              color: Colors.white)),
                    ),
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            "${name} ${prenom}",
                            style: TextStyle(
                                fontSize: size.width < 350 ? 15 : 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: role_as == 'ROLE_RECRUTEUR' ? Text(
                            "Compte recuteur",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width < 350 ? 10 : 15),
                          ) : Text(
                            "Compte fournisseur",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width < 350 ? 10 : 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width < 350 ? 12 : 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/ci.png',width: 30,),
                    title: Text("${pays}, ${ville}"),
                  ),
                  ListTile(
                    leading: Icon(Icons.call,color: Colors.black,size: 30,),
                    title: Text("${contact}"),
                  ),
                  ListTile(
                    leading: Icon(Icons.email,color: Colors.black,size: 30,),
                    title: Text("${email}"),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/badge-CERTIFIER 1.png',
                      width: size.width < 350 ? 40 : 60,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      badge == 1
                          ? "déjà certifié"
                          : "Obtenir un badge certifié",
                      style: TextStyle(
                          color: badge == 1 ? Colors.green : blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Membre depuis le ${formatedDate}",
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        );
  }
}
