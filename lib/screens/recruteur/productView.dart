import 'dart:convert';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:http/http.dart' as http;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/models/produit_fournisseur_model.dart';
import 'package:flutter/material.dart';


class ProductView extends StatefulWidget {
  const ProductView({Key? key,required this.ID_PRODUCT}) : super(key: key);
  final ID_PRODUCT;
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<dynamic> categoryItemlist = [];
  /////////////////////// GET PRODUITS BY ID ///////
  Future<List<ModelProduitsFournisseur>> getProduits() async {
    String myUrl = "$getProductFournisseurs_by_id?id_produit=${widget.ID_PRODUCT}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['produits'].cast<Map<String, dynamic>>();
      return data.map<ModelProduitsFournisseur>((json) => ModelProduitsFournisseur.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  late Future<List<ModelProduitsFournisseur>> futureProduits;

  ////////////////// GET PHOTO PRODUCT BY ID PRODUCT ///////
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
  @override
  void initState() {
    // TODO: implement initState
    futureProduits = getProduits();
    getProduitsPhoto();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<List<ModelProduitsFournisseur>>(
        future: futureProduits,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  var path = "${FILE_PRODUIT_PATH}/${snapshot.data![i].name}_${snapshot.data![i].prenom}/";
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: Image.asset(
                              'assets/images/ordi2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              right: 6,
                              child: Container(
                                height: 25,
                                padding: EdgeInsets.all(12),
                                margin: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: snapshot.data![i].nb_vue == "0" ? AssetImage('assets/images/check-double-line.png') :AssetImage('assets/images/vu.png'),
                                    )
                                ),
                              )
                          ),
                        ],
                      ),
                      //etoil icon
                      //multiple images
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 10),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                              //border: Border.all(color: Colors.grey),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.4),
                                  spreadRadius: 1.5,
                                  blurRadius: 1.5,
                                  offset: const Offset(0.3, 0.3),
                                ),
                              ],

                            ),
                            child: Column(
                              children: [
                                CarouselSlider.builder(
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text:  TextSpan(
                                      text: '${snapshot.data![i].nom_produit} ....\n',
                                      style: TextStyle(
                                          fontSize: 18,
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
                              ],
                            )
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child:  Container(
                          padding: const EdgeInsets.all(10),
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.4),
                                spreadRadius: 1.5,
                                blurRadius: 1.5,
                                offset: const Offset(0.3, 0.3),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child:Padding(
                                  padding: EdgeInsets.only(bottom: 6,top: 6),
                                  child: Text('CARACTÉRISTIQUES PRINCIPALES',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                                ),
                              ),
                              Divider(color: Colors.grey,),
                              SizedBox(height: 10,),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text('${snapshot.data![i].description}',textAlign: TextAlign.justify,),

                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child:  Container(
                          padding: const EdgeInsets.all(10),
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.4),
                                spreadRadius: 1.5,
                                blurRadius: 1.5,
                                offset: const Offset(0.3, 0.3),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child:Padding(
                                  padding: EdgeInsets.only(bottom: 6,top: 6),
                                  child: Text('Information'.toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                                ),
                              ),
                              Divider(color: Colors.grey,),
                              SizedBox(height: 10,),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Catégorie'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data![i].nom_categorie}',style: TextStyle(color: Colors.blue),),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Sous-catégorie'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data![i].nom_sous_categorie}',style: TextStyle(color: Colors.blue),),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Etat du produit'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data![i].nom_etat}',style: TextStyle(color: Colors.blue),),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Localisation'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data![i].localisation}',style: TextStyle(color: Colors.blue),),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Nombre de pièces'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data![i].stock} pièces',style: TextStyle(color: Colors.blue),),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Numéro de téléphone'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data![i].contact}',style: TextStyle(color: Colors.blue),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(color: Colors.grey,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Prix officiel',
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),),
                                        Text('${snapshot.data![i].prix_vente} FCFA ',
                                          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 12),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    color: Colors.grey,
                                    width: 2,
                                    height: 30,
                                  ),
                                  Expanded(
                                    child:   Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Prix partenaire',  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                          Text('${snapshot.data![i].prix_fournisseur} FCFA',  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 12)),
                                        ],
                                      ),
                                    ),
                                  ),


                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                    ],
                  );
                });
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
