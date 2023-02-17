import 'dart:convert';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/models/produit_fournisseur_model.dart';
import 'package:http/http.dart' as http;

import 'package:daymonde_collaboration/components/fournisseur/commande/BottomNavBar.dart';
import 'package:daymonde_collaboration/components/fournisseur/commande/prduitCard.dart';
import 'package:daymonde_collaboration/components/fournisseur/commande/produitCArdInactif.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/Apercu_produit_screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/Indisponible_produit_screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/notification_screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/parametres/parametreScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeFournisseur extends StatefulWidget {
  const HomeFournisseur({Key? key}) : super(key: key);

  @override
  State<HomeFournisseur> createState() => _HomeFournisseurState();
}

class _HomeFournisseurState extends State<HomeFournisseur> {
  String? name;
  String? prenom;
  String  photo_fournisseur ='avatart.jpg';
  getUserDetails() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    int id_recruteur = pre.getInt('userId') ?? 0;
    String myUrl = "$fournisseursDetails?id_user=${id_recruteur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['fournisseurs_info'];
      ////////////// SET DATA IN SESION ////////
      pre.setString('name',jsonResponse['name']);
      pre.setString('prenom',jsonResponse['prenom']);
      pre.setString('photo_fournisseur', jsonResponse['photo']);

    } else {
      throw Exception('Failed to load album');
    }
  }
  void laodInfoUsers() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    /////////////// GET DATA IN SESSION /////////
   setState(() {
     name = pre.getString('name');
     prenom = pre.getString('prenom');
     photo_fournisseur = pre.getString('photo_fournisseur')!;
   });
  }
  Future<List<ModelProduitsFournisseur>> getAllProducts() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int id_fournisseurs_user = pref.getInt('userId') ?? 0;
    String myUrl = "$getAllProductFournisseur?id_fournisseurs_user=${id_fournisseurs_user}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['products_all'].cast<Map<String, dynamic>>();
      print(jsonResponse['products_all']);
      return data.map<ModelProduitsFournisseur>((json) => ModelProduitsFournisseur.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  // This widget is the root of your application.
  late Future<List<ModelProduitsFournisseur>> futureAllProducts;
  @override
  void initState() {
    // TODO: implement initState
    laodInfoUsers();
    getUserDetails();
    futureAllProducts = getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: grey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: black),
            title: Container(
              decoration:  const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2,color: grey)
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:  [
                        GestureDetector(
                          onTap: ()=> Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>ParametreFournisseursScreen())),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("${FILE_PATH_USER}/${photo_fournisseur}"),
                          ),
                        ),
                        Text(" ""${name} ${prenom}",style: TextStyle(fontSize:14,color: black))
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                        IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPageScreen()));
                            },
                            icon: const Icon(Icons.notifications)),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            bottom: TabBar(
                labelColor:blue,
                unselectedLabelColor:black,
                indicatorColor: blue,
                tabs: [
                  Tab(
                    icon:  FutureBuilder<List<ModelProduitsFournisseur>>(
                      future: futureAllProducts,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text("Produits ${snapshot.data!.length}");
                        } else {
                          return Center(child: Container());
                        }
                      },
                    ),
                  ),
                  Tab(text: "Produits inactifs""4",)
                ]) ,

          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: size.height/1.8,
                  child:  FutureBuilder<List<ModelProduitsFournisseur>>(
                    future: futureAllProducts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: size.width<320 ?2: 3 ,
                                mainAxisExtent: 230
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return  GestureDetector(
                                onTap: ()=>Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>ApercuProduitScreen(ID_PRODUCT: snapshot.data![index].ID_PRODUIT,))),
                                child: ProduitCard(
                                  image: "${FILE_PRODUIT_PATH}/${snapshot.data![index].name}_${snapshot.data![index].prenom}/${snapshot.data![index].photo_produit_principal}",
                                  title: "${snapshot.data![index].nom_produit}",
                                  prix: "${snapshot.data![index].prix_vente}""FCFA",
                                  statut:  snapshot.data![index].prod_certifie == '0' ?
                                  Image.asset("assets/images/black_stack.png",width:40)
                                   :
                                  Image.asset("assets/images/stack.png",width:25),
                                  statutSize:  30,
                                ),
                              );
                            }
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height/1.8,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FutureBuilder<List<ModelProduitsFournisseur>>(
                    future: futureAllProducts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: size.width<320 ?2: 3 ,
                                mainAxisExtent: 177
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return  GestureDetector(
                                onTap: ()=>Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>ProduitIndisponibleScreen(ID_PRODUCT:snapshot.data![index].ID_PRODUIT,))),
                                child: Column(
                                  children: [
                                    ProduitCardInactif(
                                      image: "assets/images/Image3.png",
                                      title: "Téléphone portable IPhone 7 Téléphone portable IPhone 7",
                                      prix: "200000""FCFA",
                                      BackColor: const Color.fromRGBO(112, 112, 112, 86),
                                      etat: "Produit suprimé",
                                      textColor: light,

                                    ),
                                  ],
                                ),
                              );
                            }
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  )

                ),
              )

            ],
          ),
          bottomNavigationBar: BottomNavbarFournisseur(selectedIndex: 0,),
        )
    );

  }
}
