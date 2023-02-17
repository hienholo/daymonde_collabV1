import 'dart:convert';
import 'package:daymonde_collaboration/screens/LaoderScreen.dart';
import 'package:http/http.dart' as http;


import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/screens/recruteur/detailVendeur.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProduitVendeurScreen extends StatefulWidget {
  const ProduitVendeurScreen({Key? key,
    this.Niveaux_base_vendeur,
    this.Niveaux_increment_vendeur
  }) : super(key: key);

  final Niveaux_base_vendeur;
  final Niveaux_increment_vendeur;

  @override
  State<ProduitVendeurScreen> createState() => _ProduitVendeurScreenState();
}

class _ProduitVendeurScreenState extends State<ProduitVendeurScreen> {
  DateTime now = DateTime.now();
/////////////////////// GET ALL FOURNISSEURS ///////
  List<dynamic> dataUsersInfos = [];
  bool laoding = true;
  //text editing controller for text field
  Future<void> getRecruteurById() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int id_fournisseur = pref.getInt('userId') ?? 0;
    String myUrl = "$userDetailURL?id_user=${id_fournisseur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['recruteur_infos'];
      setState(() {
        dataUsersInfos.add(jsonResponse);
          laoding = false;
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getRecruteurById();
    initializeDateFormatting('fr_FR', null).then((_) => now);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    int niveau_restant = int.parse(widget.Niveaux_base_vendeur) - int.parse(widget.Niveaux_increment_vendeur);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: ()=>Navigator.pop(context),
            child: Icon(Icons.chevron_left,color: Colors.black,)
        ),
        title: laoding ? Container() : Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${FILE_PATH_USER}/${dataUsersInfos[0]['photo']}'),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text('${dataUsersInfos[0]['name']} ${dataUsersInfos[0]['prenom']}',style: TextStyle(color: Colors.black,fontSize: 18),),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.delete,color: Colors.black,)
          )
        ],
      ),
      body: laoding ? LoaderPageScreen()
          : ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ],
              ),
              child: ListTile(
                leading: Image.asset('assets/images/PC.png',width: 100,),
                title: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text('Ordinateur portable pliable dual core, 500 GB / 4GB'),
                ),
                subtitle: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Affichage du sous titre'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('76 000 Fcfa'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 5,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lieu de vente',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),
                      Text("Abidjan il y'a 12 min"),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Prix de vente',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),
                      Text("95 000 FCFA",),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gain du vendeur',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,),),
                      Text("15 000 FCFA",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Text('Vous bénéficiez de 1000 Fcfa sur cette transaction',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 5,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ],
              ),
              child:InkWell(
                onTap: ()=>Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>DetailVendeur())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Niveau',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                    Text('${widget.Niveaux_increment_vendeur}/${widget.Niveaux_base_vendeur}',style: TextStyle(fontSize: 16,),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: laoding ? Container() : Container(
        height: 100,
        child:  Padding(
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
        ),
      ),
    );
  }
}
