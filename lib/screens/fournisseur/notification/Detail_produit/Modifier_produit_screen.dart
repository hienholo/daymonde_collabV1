import 'dart:convert';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:http/http.dart' as http;

import 'package:daymonde_collaboration/models/produit_fournisseur_model.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/fournisseur_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProduitModifierScreen extends StatefulWidget {
  const ProduitModifierScreen({super.key,required this.ID_PRODUCT});
  final ID_PRODUCT;
  @override
  State<ProduitModifierScreen> createState() => _ProduitModifierScreenState();
}
List<dynamic> categoryItemlist = [];
bool _star = false;
bool _radar = false;

class _ProduitModifierScreenState extends State<ProduitModifierScreen> {
  @override
  /////////////////////// GET PRODUITS BY ID ///////
  Future<List<ModelProduitsFournisseur>> getProduits() async {
    String myUrl = "$getProductFournisseurs_by_id?id_produit=${widget.ID_PRODUCT}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse['produits']);
      var data = jsonResponse['produits'].cast<Map<String, dynamic>>();
      return data.map<ModelProduitsFournisseur>((json) => ModelProduitsFournisseur.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  Future<void> getProduitsPhoto() async {
    String myUrl = "$getProductFournisseurs_by_id?id_produit=${widget.ID_PRODUCT}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['photo_produit'];
      setState(() {
        categoryItemlist  = jsonResponse ;
        print(categoryItemlist);
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  late Future<List<ModelProduitsFournisseur>> futureProduits;

  @override
  void initState() {
    // TODO: implement initState
    futureProduits = getProduits();
    getProduitsPhoto();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width < 320 ? 9 : size.width == 320 ? 11 : 13;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Aperçu',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              // popupmenu item 1
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.delete_sweep_outlined),
                    SizedBox(
                      // sized box with width 10
                      width: 15,
                    ),
                    Text("Supprimer")
                  ],
                ),
              ),
              // popupmenu item 2
            ],
            position: PopupMenuPosition.under,
            offset: Offset(0, 8),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        elevation: 0,
      ),
      //
      //
      body: FutureBuilder<List<ModelProduitsFournisseur>>(
        future: futureProduits,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  var path = "${FILE_PRODUIT_PATH}/${snapshot.data![i].name}_${snapshot.data![i].prenom}/";
                  return  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/4,
                              decoration: BoxDecoration(),
                              child: Image.network(
                                '${FILE_PRODUIT_PATH}/${snapshot.data![i].name}_${snapshot.data![i].prenom}/${snapshot.data![i].photo_produit_principal}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            //etoil icon
                            Positioned(
                              top: 10,
                              right: 4,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white)
                                ),
                                child: InkWell(
                                  child: Icon(
                                    _star ? Icons.star : Icons.star_outline,
                                    color: snapshot.data![i].prod_certifie != '0' ? Colors.yellow : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
//multiple images
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                aspectRatio: 4.0,
                                enlargeCenterPage: false,
                                viewportFraction: 2,
                              ),
                              itemCount: 4,
                              itemBuilder: (context, index, realIdx) {
                                final int first = index * 2;
                                final int second = first + 1;
                                // final int third = second + 3;
                                return Row(
                                  children: categoryItemlist.map((index) {
                                    return Expanded(
                                      flex: 1,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                            //  top: 8.0, left: 10, right: 10
                                          ),
                                          child: Container(
                                            height: 100,
                                            width: 150,
                                            margin:  EdgeInsets.only(top: 2, left: 2, right: 2),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black26),
                                              borderRadius: BorderRadius.circular(4),
                                              image: DecorationImage(
                                                image: NetworkImage('${FILE_PRODUIT_PATH}/${snapshot.data![i].name}_${snapshot.data![i].prenom}/${index['photo']}',
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                        ),

                        Center(
                          child: RichText(
                            // textAlign: TextAlign.left,
                            text:  TextSpan(
                              text: '${snapshot.data![i].nom_produit}\n',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "Le titre de l'article ici couleur gise noire",
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // 1e cadre
                        Card(
                          margin:
                          const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 4),
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black54,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
                                //
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('CARACTERISTIQUES PRINCIPALES'),
                                ),
                              ),
                              Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text('${snapshot.data![i].description}',textAlign: TextAlign.justify,),

                                  )
                              ),
                            ],
                          ),
                        ),
                        //2eme cadre
                        Card(
                          margin:
                          const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 4),
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black54,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
                                //
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('INFORMATION'),
                                ),
                              ),
                              Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 20, bottom: 25),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: RichText(
                                            text: const TextSpan(
                                              text: "Catégorie \n\n",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 40, 39, 39)),
                                              children: [
                                                TextSpan(text: 'Sous-catégorie\n\n'),
                                                TextSpan(text: 'Etat du produit\n\n'),
                                                TextSpan(text: 'Localisation\n\n'),
                                                TextSpan(text: 'Nombre de pièces\n\n'),
                                                TextSpan(text: 'Numéro de téléphone:'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, top: 20, bottom: 25),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: RichText(
                                            text:  TextSpan(
                                              text: "${snapshot.data![i].nom_categorie}\n\n",
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 5, 65, 169),
                                              ),
                                              children: [
                                                TextSpan(text: '${snapshot.data![i].nom_sous_categorie}\n\n'),
                                                TextSpan(text: '${snapshot.data![i].nom_etat}\n\n'),
                                                TextSpan(text: '${snapshot.data![i].nom_ville}\n\n'),
                                                TextSpan(text: '${snapshot.data![i].stock} pièces\n\n'),
                                                TextSpan(text: ' ${snapshot.data![i].contact}'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //affiche texte prix
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 50, left: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Prix officiel',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: fontsize),
                                        children:  [
                                          TextSpan(
                                            text: ' ${snapshot.data![i].prix_vente} Fcfa',
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Text(
                                    //   "Reçu : 10.Jan.2022  10:12",
                                    //   style: TextStyle(fontSize: 10),
                                    // ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4, right: 2),
                                child: Container(
                                  width: size.width * 0.01,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  child: const Text(''),
                                ),
                              ),
                              Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Prix parténaire',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: fontsize),
                                        children:  [
                                          TextSpan(
                                            text: ' ${snapshot.data![i].prix_fournisseur} Fcfa',
                                            style: TextStyle(color: Colors.blue),
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
                      ],
                    ),
                  );
                });
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
      bottomNavigationBar: FournisseurBottomNavBar(selectedIndex : 1,ID_PRODUCT : widget.ID_PRODUCT),
    );
  }
}
