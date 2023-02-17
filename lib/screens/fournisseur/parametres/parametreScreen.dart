import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/screens/fournisseur/parametres/ParrainScreen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/parametres/ProfilFournisseurScreen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/parametres/condition_utilisation_screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/parametres/plus_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ParametreFournisseursScreen extends StatefulWidget {
  const ParametreFournisseursScreen({Key? key}) : super(key: key);

  @override
  State<ParametreFournisseursScreen> createState() => _ParametreFournisseursScreenState();
}

class _ParametreFournisseursScreenState extends State<ParametreFournisseursScreen> {
  String? name;
  String? prenom;
  String? boutique_fournisseur;
  String  photo_fournisseur ='avatart.jpg';
  String  photo_recuteur ='avatart.jpg';
  String?ID_RECRUTEUR;
  String?nom_recuteur;
  String?prenom_recuteur;
  String?date_add_recuteur;
  String?pays_recuteur;
  String?ville_recuteur;
  String?num_what_recuteur;
  String?numbre_prod_add;
  String?numbre_prod_certifie;

  getUserDetails() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    int id_recruteur = pre.getInt('userId') ?? 0;
    String myUrl = "$fournisseursDetails?id_user=${id_recruteur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['fournisseurs_info'];
      var jsonResponse2 = json.decode(response.body)['parain_info'];
      var jsonResponseProduits_add = json.decode(response.body)['produits_add'];
      var jsonResponseProduits_certifie = json.decode(response.body)['produits_certifie'];
      print(jsonResponseProduits_add);
      print(jsonResponseProduits_certifie);
      ////////////// SET DATA IN SESION ////////
      pre.setString('name',jsonResponse['name']);
      pre.setString('prenom',jsonResponse['prenom']);
      pre.setString('boutique_fournisseur',jsonResponse['nom_etablissement']);
      pre.setString('photo_fournisseur', jsonResponse['photo']);
      pre.setString('ID_RECRUTEUR', jsonResponse2['ID_RECRUTEUR']);
      pre.setString('photo_recuteur', jsonResponse2['photo']);
      pre.setString('nom_recuteur', jsonResponse2['name']);
      pre.setString('prenom_recuteur', jsonResponse2['prenom']);
      pre.setString('date_add_recuteur', jsonResponse2['created_at']);
      pre.setString('pays_recuteur', jsonResponse2['pays']);
      pre.setString('ville_recuteur', jsonResponse2['ville']);
      pre.setString('num_what_recuteur', jsonResponse2['contact_whatsap']);
      pre.setString('numbre_prod_add', jsonResponseProduits_add.toString());
      pre.setString('numbre_prod_certifie', jsonResponseProduits_certifie.toString());
    } else {
      throw Exception('Failed to load album');
    }
  }
  void laodInfoUsers() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      /////////////// GET DATA IN SESSION /////////
      name = pre.getString('name');
      prenom = pre.getString('prenom');
      boutique_fournisseur = pre.getString('boutique_fournisseur');
      photo_fournisseur = pre.getString('photo_fournisseur')!;
      photo_recuteur = pre.getString('photo_recuteur')!;
      ID_RECRUTEUR = pre.getString('ID_RECRUTEUR');

      nom_recuteur = pre.getString('nom_recuteur');
      prenom_recuteur = pre.getString('prenom_recuteur');
      date_add_recuteur = pre.getString('date_add_recuteur');
      pays_recuteur = pre.getString('pays_recuteur');
      ville_recuteur = pre.getString('ville_recuteur');
      num_what_recuteur = pre.getString('num_what_recuteur');

      numbre_prod_add = pre.getString('numbre_prod_add');
      numbre_prod_certifie = pre.getString('numbre_prod_certifie');


    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getUserDetails();
    laodInfoUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 22, 103, 10),
        toolbarHeight: 110,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              child: Column(
                children: [
                   Stack(
                    children: [Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                            Padding(
                                padding: EdgeInsets.only(right: 40,bottom: 40),
                                child: Icon(Icons.business_center,size: 40,color: Colors.white,)
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12,bottom: 40),
                              child:InkWell(
                                
                                child: Text('${boutique_fournisseur}',
                                  style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                              ) 
                              
                            )
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(bottom: 12),
                          child:Row(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: ()=> Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>ProfilFournisseurScreen())),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2,top: 5,right: 70),
                                        child: Text('Bonjour',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text('${name} ${prenom}',style: TextStyle(fontSize: 25,),),
                                      ),
                                    ],
                                  ),
                                )
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      right: 10,
                      top: 40,
                      child:  InkWell(
                        onTap: ()=> Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>ProfilFournisseurScreen())),
                        child:Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: Stack(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 4, color: Colors.white),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        color: Colors.blue.withOpacity(0.1),
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage('${FILE_PATH_USER}/${photo_fournisseur}'),
                                    )

                                ),
                              ),
                            ],
                          ),

                        ) ,
                      )


                    )
                    ]
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget> [
          Container(
            padding: EdgeInsets.only(right:2,left: 2),
            color: Colors.grey.shade200,
            height: 450,//MediaQuery.of(context).size.height*0.7,
            child: Column(
              children: <Widget> [
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.1,
                        blurRadius: 0.1,
                        offset: Offset(0.0, 0.0),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: InkWell(
                      onTap: ()=> Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> PlusinfoFournisseurDaymond() )),
                      child: Row(
                        children: [
                          Icon(Icons.info_outlined,size: 40,),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text("Plus d'informations",style: TextStyle(fontSize: 20),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.1,
                        blurRadius: 0.1,
                        offset: Offset(0.0, 0.0),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(12),
                      child: InkWell(
                        //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> CentreAssistant())),
                        child: Row(
                          children: [
                            Icon(Icons.message,size: 40,color: Colors.blue,),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("Centre d'assistance",style: TextStyle(fontSize: 20),),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.1,
                        blurRadius: 0.1,
                        offset: Offset(0.0, 0.0),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  child:   Padding(
                    padding: EdgeInsets.all(12),
                    child: InkWell(
                      onTap: ()=>Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>ConditionUtilisationScreen())),
                      child: Row(
                        children: [
                          Icon(Icons.edit_note,size: 40,),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text("Conditions d'utilisation",style: TextStyle(fontSize: 20),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.1,
                        blurRadius: 0.1,
                        offset: Offset(0.0, 0.0),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(12),
                      child: InkWell(
                        onTap: ()=> Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>ParrainFournisseurScreen(
                              ID_RECRUTEUR:ID_RECRUTEUR ,
                              PHOTO_PARAIN: photo_recuteur,
                              nom_recuteur: nom_recuteur,
                              prenom_recuteur: prenom_recuteur,
                              date_add_recuteur: date_add_recuteur,
                              pays_recuteur: pays_recuteur,
                              ville_recuteur: ville_recuteur,
                              num_what_recuteur: num_what_recuteur,
                              numbre_prod_certifie: numbre_prod_certifie,
                              numbre_prod_add: numbre_prod_add,
                            ))),
                        child: Row(
                          children: [
                              Image.network('${FILE_PATH_USER}/${photo_recuteur}',width: 48,),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text('Mon parrain ',style: TextStyle(fontSize: 20),),
                            )
                          ],
                        ),
                      )
                  ),
                )

              ],
            ),
          ),
        ],
      ),

    );
  }
}
