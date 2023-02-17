import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/models/vendeur_commande_model.dart';
import 'package:daymonde_collaboration/screens/recruteur/produit_vendeur_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailVendeur extends StatefulWidget {
  const DetailVendeur({Key? key,
    this.photo_vendeur,
    this.Nom_vendeur,
    this.Prenoms_vendeur,
    this.Date_add_vendeur,
    this.Pays_vendeur,
    this.Villes_vendeur,
    this.Numeros_vendeur,
    this.ID_vendeur,
    this.Niveaux_base_vendeur,
    this.Niveaux_increment_vendeur
  }) : super(key: key);
  final photo_vendeur;
  final Nom_vendeur;
  final Prenoms_vendeur;
  final Date_add_vendeur;
  final Pays_vendeur;
  final Villes_vendeur;
  final Numeros_vendeur;
  final ID_vendeur;
  final Niveaux_base_vendeur;
  final Niveaux_increment_vendeur;
  @override
  State<DetailVendeur> createState() => _DetailVendeurState();
}

class _DetailVendeurState extends State<DetailVendeur> {
  /////////////////////// GET ALL FOURNISSEURS ///////
  Future<List<ModelCommandes>> getCommandeRecruteurs() async {
    String myUrl = "$getCommandeRecruteur?id_user=${widget.ID_vendeur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse['commande']);
      var data = jsonResponse['commande'].cast<Map<String, dynamic>>();
      return data.map<ModelCommandes>((json) => ModelCommandes.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  late Future<List<ModelCommandes>> futureCommande;
  @override
  void initState() {
    // TODO: implement initState
    futureCommande = getCommandeRecruteurs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int niveau_restant = int.parse(widget.Niveaux_base_vendeur) - int.parse(widget.Niveaux_increment_vendeur);
    print(niveau_restant);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text('Vendeur', style: TextStyle(color: Colors.black)),
        actions: [
          PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: Text(
                        'Epingler',
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ),
                    const PopupMenuItem(
                      child: Text('Rompre le lien',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ),
                  ])
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  // ignore: prefer_const_literals_to_create_immutables
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                    ),
                  ]),
                ),
                Container(
                  height: size.width < 350 ? 80 :120,
                  decoration: BoxDecoration(
                      color: bludeBold,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))
                  ),
                ),
                Positioned(
                  top: 35,
                  left: size.width < 350 ? 20 : 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width < 350 ? 80 : 120,
                        height: size.width < 350 ? 80 : 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('${widget.photo_vendeur}'),
                                fit: BoxFit.cover),
                            border: Border.all(color: Colors.white, width: 4),
                            borderRadius: BorderRadius.circular(60)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.Nom_vendeur} ${widget.Prenoms_vendeur}',
                            style: TextStyle(
                                fontSize: size.width < 350 ? 15 : 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Membre depuis\n le ${widget.Date_add_vendeur}",
                              style: TextStyle(
                                  fontSize: size.width < 350 ? 12 : 13,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: size.width < 350 ? 90 : 150,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: size.width < 350 ? 10:250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                /*Image.asset(
                                  'assets/images/civ.png',
                                  width: size.width < 350 ? 25 : 50,
                                ),*/
                                const SizedBox(
                                  width: 15,
                                ),
                                 Text("${widget.Pays_vendeur}, ${widget.Villes_vendeur}", maxLines: 2,),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                   FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                    size: size.width < 350 ? 20 : 35,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                   Text(
                                    "${widget.Numeros_vendeur}",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                         Text(
                          'Niveau',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                         Text(
                          '${widget.Niveaux_increment_vendeur} / ${widget.Niveaux_base_vendeur}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            SizedBox(
              height: 400,
              child:  FutureBuilder<List<ModelCommandes>>(
                future: futureCommande,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: ()=>Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>ProduitVendeurScreen(Niveaux_base_vendeur:widget.Niveaux_base_vendeur,Niveaux_increment_vendeur: widget.Niveaux_increment_vendeur,))),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 177, 175, 175),
                                        offset: Offset(
                                          .5,
                                          .5,
                                        ),
                                        blurRadius: 3,
                                      ), //BoxShadow
                                      //BoxShadow
                                    ]
                                ),
                                child: ListTile(
                                  leading: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/ODINATEUR dddd.png'),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                  title: Text('${snapshot.data![i].nom_produit}'),
                                  subtitle: Text('${FormatDate('${snapshot.data![i].date_commande}')}'),
                                  trailing: Text('${snapshot.data![i].prix_vente} Fcfa',style: TextStyle(color: blue,),overflow: TextOverflow.ellipsis,),

                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),


            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 5, right: 5),
              child: Column(
                children: [
                  Text(
                      style: TextStyle(fontSize: 18),
                      'Il ne vous reste plus que ${niveau_restant} niveaux pour gagner un bonus de '),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '5000 fcfa',
                        style: TextStyle(color: blue, fontSize: 18),
                      ),
                      Text(
                        ' gratuit offert par daymond',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
