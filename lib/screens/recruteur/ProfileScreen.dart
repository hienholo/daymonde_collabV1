// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:core';
import 'dart:async';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/models/liste_vendeur_model.dart';
import 'package:daymonde_collaboration/screens/recruteur/profil_fournisseur_screen.dart';
import 'package:daymonde_collaboration/screens/recruteur/recrutFournisseur.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:daymonde_collaboration/components/profile/BottomTabbarCompteVendeur.dart';
import 'package:daymonde_collaboration/components/profile/ProfilAppabar.dart';
import 'package:daymonde_collaboration/components/profile/ProfilCard.dart';
import 'package:daymonde_collaboration/models/liste_fournisseur_model.dart';
import 'package:daymonde_collaboration/screens/recruteur/add_five_product_screen.dart';
import 'package:daymonde_collaboration/screens/recruteur/detailVendeur.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/profile/BottomTabbarCompteFournisseur.dart';
import '../../const/color.dart';
import '../../const/userData.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

enum menuitem {
  item1,
  item2,
}

class _ProfileState extends State<ProfileScreen> {
  DateTime now = DateTime.now();
  int TabBarIndexValue = 0;
  int selectedIndex = 0;
  String CompteIdex = 'compte_vendeur';
  bool Isnouveau = true;
  bool IslienRompu = false;
  bool FournNonValide = false;
  bool FournValide = true;
  String ? formatedDate;
  Future<String> getCompteIndex() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    CompteIdex = pref.getString('select_compte')!;
    setState(() {
      CompteIdex;
    });
    return CompteIdex;
  }


  /////////////////////// GET ALL FOURNISSEURS ///////
  Future<List<FournisseurModel>> getAllFornisseurs() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int id_recruteur = pref.getInt('userId') ?? 0;
    String myUrl = "$getAllFournisseur?id_recruteur=${id_recruteur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse['all_fournisseur']);
      var data = jsonResponse['all_fournisseur'].cast<Map<String, dynamic>>();
      return data.map<FournisseurModel>((json) => FournisseurModel.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  //////////////////// GET FOURNISSEURS ACTIFS ///////////////
  Future<List<FournisseurModel>> getFornisseursActifs() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int id_recruteur = pref.getInt('userId') ?? 0;
    String myUrl = "$getAllFournisseur?id_recruteur=${id_recruteur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['fournisseur_actif'].cast<Map<String, dynamic>>();
      return data.map<FournisseurModel>((json) => FournisseurModel.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  //////////////////// GET FOURNISSEURS INACTIFS ///////////////
  Future<List<FournisseurModel>> getFornisseursInactifs() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int id_recruteur = pref.getInt('userId') ?? 0;
    String myUrl = "$getAllFournisseur?id_recruteur=${id_recruteur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['fournisseur_inactif'].cast<Map<String, dynamic>>();
      return data.map<FournisseurModel>((json) => FournisseurModel.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  ////////////////// GET ALL NEWS VENDEURS ///////////////
  Future<List<ModelVendeur>> getAllVendeurs() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int id_recruteur = pref.getInt('userId') ?? 0;
    String myUrl = "$getAllVendeur?id_recruteur=${id_recruteur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['nouveaux_vendeurs'].cast<Map<String, dynamic>>();
      return data.map<ModelVendeur>((json) => ModelVendeur.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  ////////////////// GET ALL NEWS VENDEURS ///////////////
  Future<List<ModelVendeur>> getVendeursLiensRompus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int id_recruteur = pref.getInt('userId') ?? 0;
    String myUrl = "$getAllVendeur?id_recruteur=${id_recruteur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['vendeurs_liens_rompus'].cast<Map<String, dynamic>>();
      return data.map<ModelVendeur>((json) => ModelVendeur.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }


  late Future<List<FournisseurModel>> futureAllFournisseur;
  late Future<List<FournisseurModel>> futureFournisseursActifs;
  late Future<List<FournisseurModel>> futureFournisseursInactifs;

  ////////////////////: future vendeurs //////////getAllVendeurs
  late Future<List<ModelVendeur>> futureNouveauVenderus;
  late Future<List<ModelVendeur>> futureVendeursLiensRompus;

  @override
  void initState() {
      getCompteIndex();
      futureAllFournisseur = getAllFornisseurs();
      futureFournisseursActifs = getFornisseursActifs();
      futureFournisseursInactifs = getFornisseursInactifs();
      futureNouveauVenderus = getAllVendeurs();
      futureVendeursLiensRompus = getVendeursLiensRompus();
      initializeDateFormatting('fr_FR', null).then((_) => now);
    /*WidgetsBinding.instance.addPostFrameCallback((_) async {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title:   Container(
              height: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/like.png')
                )
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children:  <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text('MICHAEL KOUAME',style: TextStyle(fontSize: 20,color: blue),textAlign: TextAlign.center,),
                        Text('A été ajouté avec succès')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Divider(color: Colors.grey,),
              Center(
                child: InkWell(
                  onTap: ()=> Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: Text('Ok',style: TextStyle(color: blue,fontWeight: FontWeight.bold,fontSize: 14),),
                  ),
                ),
              ),

            ],
          );
        },
      );
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "Compte Non validé".toUpperCase(),
            text: "Votre collaborateur n'a pas encore approuvé votre collaboration veuillez le recontacter",
            confirmButtonColor: Colors.grey,
          )
      );
    });*/
      super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
    length: 2,
      child: Scaffold(
          backgroundColor: Isnouveau ? Colors.white : Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(150.0),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40.0,
              ),
              child: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                primary: true,
                title: ProfilAppbar(
                  DialogCompte: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '${CompteIdex == 'compte_vendeur' ?
                        'COMPTE VENDEUR' :
                        'COMPTE FOURNISSEUR'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: size.width < 350 ? 14 : 16,
                            overflow: TextOverflow.ellipsis,
                            color: Color.fromARGB(255, 2, 2, 2)),
                      ),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(150.0),
                  child: Column(
                    children: [
                      CompteIdex == 'compte_vendeur' ?
                      TabBar(
                      labelColor: blue,
                        automaticIndicatorColorAdjustment: true,
                        isScrollable: false, // Required
                        labelStyle:
                        TextStyle(fontSize: size.width < 350 ? 15 : 20),
                        unselectedLabelColor: const Color.fromARGB(
                        255, 138, 136, 136), // Other tabs color

                    indicatorSize:
                    TabBarIndicatorSize.label, // Space between tabs
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          color: blue, width: 4), // Indicator height
                      // Indicator width
                    ),
                    tabs: [
                      Tab(
                          child: Padding(
                              padding: EdgeInsets.only(right: .0),
                              child: FutureBuilder<List<ModelVendeur>>(
                                future: futureNouveauVenderus,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return  Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children:  [
                                          Flexible(
                                            child: Text(
                                              "Nouveaux",
                                            ),
                                          ),
                                          Text(
                                            "${snapshot.data!.length}",
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Center(child: Container());
                                  }
                                },
                              )
                          )),
                      Tab(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(color: grey, width: 3),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child:FutureBuilder<List<ModelVendeur>>(
                                future: futureVendeursLiensRompus,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return  Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children:  [
                                          Flexible(
                                            child: Text(
                                              "Liens rompus ",
                                            ),
                                          ),
                                          Text(
                                            "${snapshot.data!.length}",
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Center(child: Container());
                                  }
                                },
                              )
                            ),
                          )),
                    ],
                    onTap: (index) {
                      setState(() {
                        TabBarIndexValue = index;
                        if (index == 0) {
                          setState(() {
                            IslienRompu = false;
                            Isnouveau = true;
                          });
                        } else {
                          setState(() {
                            IslienRompu = true;
                            Isnouveau = false;
                          });
                        }
                      });
                    },
                  )
                          :
                      TabBar(
                        labelColor: blue,
                        automaticIndicatorColorAdjustment: true,
                        isScrollable: false, // Required
                        labelStyle: const TextStyle(fontSize: 20),
                        unselectedLabelColor: const Color.fromARGB(
                            255, 138, 136, 136), // Other tabs color

                        indicatorSize:
                        TabBarIndicatorSize.label, // Space between tabs
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: blue, width: 4), // Indicator height
                          // Indicator width
                        ),
                        tabs: [
                          Tab(
                              child: Padding(
                                  padding: EdgeInsets.only(right: .0),
                                  child: FutureBuilder<List<FournisseurModel>>(
                                    future: futureFournisseursActifs,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return  Container(
                                          child: Text(
                                            " Nouveaux " " ${snapshot.data!.length}",
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis),
                                          ),
                                        );
                                      } else {
                                        return Center(child: Container());
                                      }
                                    },
                                  ))),
                          Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: grey, width: 3),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: FutureBuilder<List<FournisseurModel>>(
                                    future: futureFournisseursInactifs,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return  Container(
                                          child: Text(
                                            " Inactifs " " ${snapshot.data!.length}",
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis),
                                          ),
                                        );
                                      } else {
                                        return Center(child: Container());
                                      }
                                    },
                                  )
                                ),
                              )),
                        ],
                        onTap: (index) {
                          setState(() {
                            TabBarIndexValue = index;
                            if (index == 0) {
                              setState(() {
                                IslienRompu = false;
                                Isnouveau = true;
                              });
                            } else {
                              setState(() {
                                IslienRompu = true;
                                Isnouveau = false;
                              });
                            }
                          });
                        },
                      ),

                  ],
                ),
              ),
            ),
          ),
        ),
        body:  CompteIdex == 'compte_vendeur' ?
        TabBarView(
          children: [

            SizedBox(
              height: size.height * 0.67,
              child: FutureBuilder<List<ModelVendeur>>(
                future: futureNouveauVenderus,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          DateTime date = DateTime.parse(snapshot.data![i].date_vendeur_add!);
                          var formatter = new DateFormat('EEE d MMM y HH:mm ', 'fr_FR');
                          formatedDate = formatter.format(date);
                          var now = DateTime.now();
                          var currentTime = DateFormat('EEE d MMM y HH:mm','fr_FR').format(now);
                          return GestureDetector(
                            onTap: ()=>Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>DetailVendeur(
                                  photo_vendeur: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                                  Nom_vendeur: '${snapshot.data![i].name}',
                                  Prenoms_vendeur: '${snapshot.data![i].prenom}',
                                  Date_add_vendeur: '${formatedDate}',
                                  Pays_vendeur: '${snapshot.data![i].pays}',
                                  Numeros_vendeur: '${snapshot.data![i].contact}',
                                  ID_vendeur: '${snapshot.data![i].USER_ID}',
                                  Villes_vendeur: '${snapshot.data![i].ville}',
                                  Niveaux_base_vendeur: '${snapshot.data![i].niveaux_base}',
                                  Niveaux_increment_vendeur: '${snapshot.data![i].niveaux_increment}',
                                ))),
                            child: ProfilCard(
                              date: '${formatedDate}',
                              //date: currentTime.compareTo(formatedDate!) > 0 ? "${DateFormat('HH:mm','fr_FR').format(date)} min":'${formatedDate}',
                              itemCount: users.length,
                              name: '${snapshot.data![i].name} ${snapshot.data![i].prenom}',
                              value: RichText(
                                  text: TextSpan(children:  [
                                    TextSpan(
                                        text: '${snapshot.data![i].niveaux_increment}',
                                        style: TextStyle(
                                            color: blue, fontSize: 18)),
                                    TextSpan(
                                        text: ' / ' '${snapshot.data![i].niveaux_base}',
                                        style: TextStyle(
                                          color: black,
                                        )),
                                  ])),
                              profilPicture: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                              CardColor: Colors.white,
                            ),
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.67,
              child: FutureBuilder<List<ModelVendeur>>(
                future: futureVendeursLiensRompus,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var now = DateTime.now();
                    var currentTime = DateFormat('EEE d MMM y HH:mm','fr_FR').format(now);
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          DateTime date = DateTime.parse(snapshot.data![i].date_vendeur_add!);
                          var formatter = new DateFormat('EEE d MMM y HH:mm ', 'fr_FR');
                          formatedDate = formatter.format(date);
                          return ProfilCard(
                            date: formatedDate,
                            itemCount: users.length,
                            name: '${snapshot.data![i].name} ${snapshot.data![i].prenom}',
                            value: RichText(
                                text: TextSpan(children:  [
                                  TextSpan(
                                      text: '${snapshot.data![i].niveaux_increment}',
                                      style: TextStyle(
                                          color: blue, fontSize: 18)),
                                  TextSpan(
                                      text: ' / ' '${snapshot.data![i].niveaux_base}',
                                      style: TextStyle(
                                        color: black,
                                      )),
                                ])),
                            profilPicture: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                            CardColor: Colors.red.shade50,
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )
            ),
          ],
        )
            :
        TabBarView(
          children: [
            SizedBox(
              height: size.height * 0.67,
              child: FutureBuilder<List<FournisseurModel>>(
                future: futureAllFournisseur,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          DateTime date = DateTime.parse(snapshot.data![i].date_add_recru_product!);
                          var formatter = new DateFormat('EEEE d MMMM y HH:mm:ss ', 'fr_FR');
                          formatedDate = formatter.format(date);
                          return Column(
                            children: [
                              ( snapshot.data![i].collaboration_approuve == 'COLLABORATION_APPROUVE'   &&  snapshot.data![i].demande_rupture == '0' ) ?
                              GestureDetector(
                                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>RecrutFournisseur(
                                    photo_fournisseur: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                                    Nom_fournisseur: snapshot.data![i].name,
                                    Prenoms_fournisseur: snapshot.data![i].prenom,
                                    Boutique_fournisseur: snapshot.data![i].nom_etablissement,
                                    ID_FOURNISSEUR : snapshot.data![i].FOURNISSEUR_ID,
                                    pays_fournissur : snapshot.data![i].pays,
                                    ville_fournissur : snapshot.data![i].ville,
                                    numero_fournissur : snapshot.data![i].contact,
                                    email_fournissur : snapshot.data![i].email,
                                    localisation_fournissur : snapshot.data![i].localisation,
                                    quartier_etablissement : snapshot.data![i].quartier_etablissement,
                                ))),
                                child: ProfilCard(
                                  date: '${formatedDate}',
                                  itemCount: users.length,
                                  name: '${snapshot.data![i].name} ${snapshot.data![i].prenom}',
                                  value:Column(
                                    children: [
                                      Text('${snapshot.data![i].nbre_prod_add}',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
                                      //Text('${users[i].date}',style: TextStyle(fontSize: 10),)
                                    ],
                                  ),
                                  profilPicture: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                                  CardColor: Colors.white,
                                ),
                              ) : Container(),
                            ],
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.67,
              child:  FutureBuilder<List<FournisseurModel>>(
                future: futureAllFournisseur,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          DateTime date = DateTime.parse(snapshot.data![i].date_add_recru_product!);
                          var formatter = new DateFormat('EEEE d MMMM y HH:mm:ss ', 'fr_FR');
                          formatedDate = formatter.format(date);
                          return Column(
                            children: [
                              snapshot.data![i].collaboration_approuve == '0' ?  GestureDetector(
                                onTap: () {
                                  ArtSweetAlert.show(
                                      context: context,
                                      artDialogArgs: ArtDialogArgs(
                                        type: ArtSweetAlertType.danger,
                                        title: "Non validé".toUpperCase(),
                                        text: "Votre collaborateur n'a pas encore approuvé votre collaboration veuillez le recontacter",
                                        confirmButtonColor: Colors.grey,
                                        confirmButtonText: 'Contacter le fournisseur',
                                        onConfirm: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilFounisseurScreen(
                                            photo_fournisseur: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                                            Nom_fournisseur: snapshot.data![i].name,
                                            Prenoms_fournisseur: snapshot.data![i].prenom,
                                            Boutique_fournisseur: snapshot.data![i].nom_etablissement,
                                            ID_FOURNISSEUR : snapshot.data![i].FOURNISSEUR_ID,
                                            pays_fournissur : snapshot.data![i].pays,
                                            ville_fournissur : snapshot.data![i].ville,
                                            numero_fournissur : snapshot.data![i].contact,
                                            email_fournissur : snapshot.data![i].email,
                                            localisation_fournissur : snapshot.data![i].localisation,
                                            quartier_etablissement : snapshot.data![i].quartier_etablissement,
                                          )));
                                        },
                                      )
                                  );
                                },
                                child: ProfilCard(
                                  date: formatedDate,
                                  itemCount: 4,
                                  name: '${snapshot.data![i].name} ${snapshot.data![i].prenom}' ,
                                  value:
                                  Column(
                                    children: [
                                      Icon(Icons.error_outline, color: Colors.red,size: 30,),
                                      Text('Acces non autorisé',style: TextStyle(fontSize: 10),)
                                    ],
                                  ),
                                  profilPicture: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                                  CardColor: Colors.red.shade50,
                                ),
                              ) :Container(),
                              (snapshot.data![i].collaboration_approuve == 'COLLABORATION_APPROUVE' &&  (snapshot.data![i].nbre_prod_add == '0' || snapshot.data![i].nbre_prod_add == '1'|| snapshot.data![i].nbre_prod_add == '2'|| snapshot.data![i].nbre_prod_add == '3'|| snapshot.data![i].nbre_prod_add == '4')) ?
                               GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>AddFiveProductScreen(
                                        photo_fournisseur: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                                        Nom_fournisseur: snapshot.data![i].name,
                                        Prenoms_fournisseur: snapshot.data![i].prenom,
                                        Boutique_fournisseur: snapshot.data![i].nom_etablissement,
                                        ID_FOURNISSEUR : snapshot.data![i].FOURNISSEUR_ID,
                                        pays_fournissur : snapshot.data![i].pays,
                                        ville_fournissur : snapshot.data![i].ville,
                                        numero_fournissur : snapshot.data![i].contact,
                                        email_fournissur : snapshot.data![i].email,
                                        localisation_fournissur : snapshot.data![i].localisation,
                                        quartier_etablissement : snapshot.data![i].quartier_etablissement,
                                      )));
                                },
                                child: ProfilCard(
                                  date: formatedDate,
                                  itemCount: 4,
                                  name: '${snapshot.data![i].name} ${snapshot.data![i].prenom}' ,
                                  value:
                                  Column(
                                    children: [
                                      Icon(Icons.check_circle_outline, color: Colors.green,size: 30,),
                                      Text('Acces autorisé',style: TextStyle(fontSize: 10),)
                                    ],
                                  ),
                                  profilPicture: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                                  CardColor: Colors.red.shade50,
                                ),
                              ) :Container(),
                              (snapshot.data![i].collaboration_approuve == 'COLLABORATION_APPROUVE' && snapshot.data![i].demande_rupture != '0'  ) ?  GestureDetector(
                                child: ProfilCard(
                                  date: formatedDate,
                                  itemCount: 4,
                                  name: '${snapshot.data![i].name} ${snapshot.data![i].prenom}' ,
                                  value:
                                  Column(
                                    children: [
                                      Image.asset('assets/images/lien_rompu.png',width: 30,),
                                      Text('Lien rompu',style: TextStyle(fontSize: 10),)
                                    ],
                                  ),
                                  profilPicture: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                                  CardColor: Colors.red.shade50,
                                ),
                              ) :Container(),
                            ],
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),

        bottomNavigationBar: SizedBox(
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
      )
    );
  }
}

