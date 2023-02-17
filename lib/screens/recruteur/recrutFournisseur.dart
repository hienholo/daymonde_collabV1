// ignore_for_file: file_names

import 'dart:convert';
import 'package:daymonde_collaboration/screens/recruteur/add_produits/Add_produit_enGros1_Screen.dart';
import 'package:daymonde_collaboration/screens/recruteur/add_produits/Add_produit_unitaire_Screen.dart';
import 'package:daymonde_collaboration/screens/recruteur/productView.dart';
import 'package:http/http.dart' as http;


import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/models/produit_fournisseur_model.dart';
import 'package:daymonde_collaboration/screens/recruteur/profil_fournisseur_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const/color.dart';

class RecrutFournisseur extends StatefulWidget {
  const RecrutFournisseur({Key? key,
    required this.photo_fournisseur,
    required this.Nom_fournisseur,
    required this.Prenoms_fournisseur,
    required this.Boutique_fournisseur,
    required this.ID_FOURNISSEUR,
    required this.pays_fournissur,
    required this.ville_fournissur,
    required this.numero_fournissur,
    required this.email_fournissur,
    required this.quartier_etablissement,
    required this.localisation_fournissur,
  }) : super(key: key);
  final photo_fournisseur;
  final Nom_fournisseur;
  final Prenoms_fournisseur;
  final Boutique_fournisseur;
  final ID_FOURNISSEUR;
  final pays_fournissur;
  final ville_fournissur;
  final numero_fournissur;
  final email_fournissur;
  final localisation_fournissur;
  final quartier_etablissement;
  @override
  State<RecrutFournisseur> createState() => _RecrutFournisseurState();
}

enum menuitem {
  item1,
  item2,
}

class _RecrutFournisseurState extends State<RecrutFournisseur> {
  DateTime now = DateTime.now();
  int TabBarIndexValue = 0;
  int selectedIndex = 0;
  bool isProduit = true;
  bool isCertifiedProduct = false;
  menuitem? _mitem = menuitem.item1;
  /////////////////////// GET ALL PRODUITS CERTIFIES ///////
  Future<List<ModelProduitsFournisseur>> getProduitsCertifes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int recruteur_id = pref.getInt('userId') ?? 0;
    String myUrl = "$getProductFournisseurs?recruteur_id=${recruteur_id}&&fournisseurs_id=${widget.ID_FOURNISSEUR}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['products_certifie'].cast<Map<String, dynamic>>();
      return data.map<ModelProduitsFournisseur>((json) => ModelProduitsFournisseur.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  /////////////////////// GET ALL PRODUITS ///////
  Future<List<ModelProduitsFournisseur>> getProduits() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int recruteur_id = pref.getInt('userId') ?? 0;
    String myUrl = "$getProductFournisseurs?recruteur_id=${recruteur_id}&&fournisseurs_id=${widget.ID_FOURNISSEUR}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['products_all'].cast<Map<String, dynamic>>();
      return data.map<ModelProduitsFournisseur>((json) => ModelProduitsFournisseur.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  late Future<List<ModelProduitsFournisseur>> futureProduitsCertifie;
  late Future<List<ModelProduitsFournisseur>> futureProduits;

  @override
  void initState() {
    futureProduitsCertifie = getProduitsCertifes();
    futureProduits = getProduits();
    initializeDateFormatting('fr_FR', null).then((_) => now);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            actions: [
              IconButton(
                onPressed:()=>showModalBottomSheet<void>(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 300,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              "assets/images/recrutment.png",
                              width: size.width < 350 ? 25 : 50,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              height: 2,
                              thickness: 2,
                              endIndent: 130,
                              indent: 130,
                            ),
                            const SizedBox(height: 5),
                            const Text('Choisir le type de vente'),
                            const SizedBox(height: 15),
                            Column(
                              children: [
                                GestureDetector(
                                  child: Card(
                                    elevation: 5,
                                    child: ListTile(
                                      onTap: ()=> Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>AjoutprodruitRecruUnitaireScreen())),
                                      title: const SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child:
                                          Text('Vente unitaire ')),
                                      leading: Radio<menuitem>(
                                        value: menuitem.item1,
                                        activeColor: Colors.orange,
                                        groupValue: _mitem,
                                        onChanged: (menuitem? value) {
                                          setState(() {
                                            _mitem = value;
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context)=>AjoutprodruitRecruUnitaireScreen()));
                                          });
                                        },
                                      ),
                                      trailing: const Icon(Icons.navigate_next_outlined) ,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: ()=> Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>AjoutprodruitenRecuGrosScreen())),
                                  child: Card(
                                    elevation: 5,
                                    child: ListTile(
                                      title: const Text(
                                        'Vent en gros',
                                        style: TextStyle(),
                                      ),
                                      leading: Radio<menuitem>(
                                        activeColor: Colors.orange,
                                        value: menuitem.item2,
                                        groupValue: _mitem,
                                        onChanged: (menuitem? value) {
                                          setState(() {
                                            _mitem = value;
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context)=>AjoutprodruitenRecuGrosScreen()));
                                          });
                                        },
                                      ),
                                      trailing: const Icon(Icons.navigate_next_outlined) ,
                                    ),
                                  ),
                                ),

                              ],
                            )
                          ] ,
                        ),
                      ),
                    );
                  },
                ),
                  icon: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(70),
                        image: DecorationImage(
                            image: AssetImage('assets/images/image_add.png')
                        )
                    ),
                  ),
              ),
              IconButton(
                 onPressed:null,
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: size.width < 350 ? 25 : 35,
                  )
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                    size: size.width < 350 ? 25 : 35,
                  ))
            ],
            title: GestureDetector(
              onTap: ()=>Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ProfilFounisseurScreen(
                    photo_fournisseur:widget.photo_fournisseur,
                    Nom_fournisseur: widget.Nom_fournisseur,
                    Prenoms_fournisseur: widget.Prenoms_fournisseur,
                    Boutique_fournisseur: widget.Boutique_fournisseur,
                    ID_FOURNISSEUR : widget.ID_FOURNISSEUR,
                    pays_fournissur : widget.pays_fournissur,
                    ville_fournissur : widget.ville_fournissur,
                    numero_fournissur : widget.numero_fournissur,
                    email_fournissur : widget.email_fournissur,
                    localisation_fournissur : widget.localisation_fournissur,
                    quartier_etablissement : widget.quartier_etablissement,
                  ))),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: blue,
                      image: DecorationImage(
                        image: NetworkImage('${widget.photo_fournisseur}'),
                          fit: BoxFit.cover
                      )
                    )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.Nom_fournisseur} ${widget.Prenoms_fournisseur}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("${widget.Boutique_fournisseur}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: DefaultTabController(
                length: 2,
                child: TabBar(
                  labelColor: blue,
                  automaticIndicatorColorAdjustment: true,
                  isScrollable: false, // Required
                  labelStyle: const TextStyle(fontSize: 20),
                  unselectedLabelColor: const Color.fromARGB(
                      255, 138, 136, 136), // Other tabs color

                  indicatorSize:
                      TabBarIndicatorSize.label, // Space between tabs
                  indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(color: blue, width: 4), // Indicator height
                    // Indicator width
                  ),
                  tabs: [
                    Tab(
                        child: Padding(
                            padding: EdgeInsets.only(right: .0),
                            child: Container(
                              child: FutureBuilder<List<ModelProduitsFournisseur>>(
                                future: futureProduits,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children:  [
                                          Flexible(
                                            child: Text(
                                              "Produits",
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
                              ),
                            ))),
                    Tab(
                        child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(color: grey, width: 3),
                        ),
                      ),
                      child: FutureBuilder<List<ModelProduitsFournisseur>>(
                        future: futureProduitsCertifie,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:  [
                                  Flexible(
                                    child: Text(
                                      "Produits certifiés",
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
                      ),
                    )),
                  ],
                  onTap: (index) {
                    setState(() {
                      TabBarIndexValue = index;
                      if (index == 0) {
                        setState(() {
                          isCertifiedProduct = false;
                          isProduit = true;
                        });
                      } else {
                        setState(() {
                          isCertifiedProduct = true;
                          isProduit = false;
                        });
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: isProduit,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: .0,left: 6,right: 6),
                  child: Column(
                    children: [
                      SizedBox(
                          height: size.height * 0.61,
                          child:FutureBuilder<List<ModelProduitsFournisseur>>(
                            future: futureProduits,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GridView.count(
                                  crossAxisCount: size.width < 350 ? 2 : 3,
                                  childAspectRatio: .61,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 2,
                                  children: List.generate(snapshot.data!.length, (index) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductView(ID_PRODUCT:snapshot.data![index].ID_PRODUIT)));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10)),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Image.network(
                                                  "${FILE_PRODUIT_PATH}/${snapshot.data![index].name}_${snapshot.data![index].prenom}/${snapshot.data![index].photo_produit_principal}",width: 80,
                                                ),
                                                /*
                                               Image.network(
                                                "${FILE_PRODUIT_PATH}/${snapshot.data![index].name}_${snapshot.data![index].prenom}",width: 80,
                                              ),
                                              * */
                                                Text(
                                                  "${snapshot.data![index].nom_produit}",
                                                ),
                                                Column(
                                                  children: [
                                                    Text('${snapshot.data![index].prix_vente} Fcfa',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    snapshot.data![index].nb_vue !='0' ? Image.asset('assets/images/vu.png',width: 20,):Image.asset('assets/images/check-double-line.png',width: 20,),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                );
                              } else {
                                return Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isCertifiedProduct,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20.0, bottom: .0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.61,
                        child:FutureBuilder<List<ModelProduitsFournisseur>>(
                          future: futureProduitsCertifie,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return GridView.count(
                                crossAxisCount: size.width < 350 ? 2 : 3,
                                childAspectRatio: .61,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                children: List.generate(snapshot.data!.length, (index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductView(ID_PRODUCT:snapshot.data![index].ID_PRODUIT)));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.network(
                                                "${FILE_PRODUIT_PATH}/${snapshot.data![index].name}_${snapshot.data![index].prenom}/${snapshot.data![index].photo_produit_principal}",width: 80,),
                                              /*
                                               Image.network(
                                                "${FILE_PRODUIT_PATH}/${snapshot.data![index].name}_${snapshot.data![index].prenom}",width: 80,
                                              ),
                                              * */
                                              Text(
                                                "${snapshot.data![index].nom_produit}",
                                              ),
                                              Column(
                                                children: [
                                                  Text('${snapshot.data![index].prix_vente} Fcfa',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  snapshot.data![index].nb_vue !='0' ? Image.asset('assets/images/vu.png',width: 20,):Image.asset('assets/images/check-double-line.png',width: 20,) ,
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
