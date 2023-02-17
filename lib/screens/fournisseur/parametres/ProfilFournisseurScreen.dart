import 'dart:convert';
import 'package:daymonde_collaboration/models/liste_fournisseur_model.dart';
import 'package:daymonde_collaboration/screens/LaoderScreen.dart';
import 'package:http/http.dart' as http;
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/screens/fournisseur/parametres/UpdateProfilFounisseurScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfilFournisseurScreen extends StatefulWidget {
  const ProfilFournisseurScreen({Key? key}) : super(key: key);

  @override
  State<ProfilFournisseurScreen> createState() => _ProfilFournisseurScreenState();
}

class _ProfilFournisseurScreenState extends State<ProfilFournisseurScreen> {
  DateTime now = DateTime.now();
/////////////////////// GET ALL FOURNISSEURS ///////
  List<dynamic> dataUsersInfos = [];
   bool laoding = true;
  //text editing controller for text field
  Future<void> getFornisseursById() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int id_fournisseur = pref.getInt('userId') ?? 0;
    String myUrl = "$fournisseursDetails?id_user=${id_fournisseur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['fournisseurs_info'];
      setState(() {
        dataUsersInfos.add(jsonResponse);
        if(dataUsersInfos.isEmpty){
          laoding = true;
        }else{
          laoding = false;
        }
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getFornisseursById();
    initializeDateFormatting('fr_FR', null).then((_) => now);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: laoding ? LoaderPageScreen()
          : ListView(
        children: [
          Stack(
            children: [
              Container(
                color: bludeBold,
                height: 180,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: ()=>Navigator.pop(context),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 90.0),
                              child: Icon(Icons.chevron_left,color: Colors.white,),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 2, color: Colors.white),
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
                                      image: NetworkImage('${FILE_PATH_USER}/${dataUsersInfos[0]['photo']}'),
                                    )

                                ),
                              ),
                              Text('${dataUsersInfos[0]['name']} ${dataUsersInfos[0]['prenom']}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 90.0),
                            child: PopupMenuButton(
                              padding: EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.more_vert_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    value: 1,
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Text(
                                            'Modifier',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                PopupMenuItem(
                                    value: 2,
                                    child: Row(
                                      children: [
                                        Icon(Icons.logout_sharp),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Text(
                                            'Déconnecté',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                PopupMenuItem(
                                    value: 3,
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Text(
                                            'Suprimer',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                              onSelected: (val) {
                                if(val == 1){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>UpdateProfilFounisseurScreen()));
                                }else if(val== 2){

                                }else if(val == 3){

                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 430,),
              Positioned(
                  top: 130,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height*1.5,
                      width: MediaQuery.of(context).size.width*0.96,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          boxShadow:  [
                            BoxShadow(
                              color: Color.fromARGB(255, 177, 175, 175),
                              offset: Offset(
                                .1,
                                .1,
                              ),
                              blurRadius: 4,
                            ), //BoxShadow
                            //BoxShadow
                          ]
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("GERANT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person),
                                        Text('Nom et Prénoms')
                                      ],
                                    ),
                                    Text('${dataUsersInfos[0]['name']} ${dataUsersInfos[0]['prenom']}')
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.call),
                                        Text('Contact 1')
                                      ],
                                    ),
                                    Text('${dataUsersInfos[0]['contact']}')
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: ListTile(
                              leading: Icon(Icons.email),
                              title: Text("${dataUsersInfos[0]['email']}",style: TextStyle(fontSize: 16),),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("Photo cni, passeport, attestation ou permis de conduit (Recto, Verso )",style: TextStyle(fontSize: 16),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset('assets/images/folder.png',width: 80,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
          SizedBox(height: 12,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("BOUTIQUE",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                ListTile(
                  leading: Image.asset('assets/images/shop.png',width: 30,color: Colors.blue,),
                  title: Text("Nom de l'etablissement",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  subtitle: Text('${dataUsersInfos[0]['nom_etablissement']}'),
                ),
                ListTile(
                  leading: Text('Localisation',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  title: Divider(color: Colors.grey,thickness: 2,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Image.asset('assets/images/icon_localisation.png',width: 30,),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pays',style: TextStyle(fontSize: 15),),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${dataUsersInfos[0]['pays']}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,textAlign: TextAlign.end),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Image.asset('assets/images/icon_localisation.png',width: 30,),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ville',style: TextStyle(fontSize: 15),),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${dataUsersInfos[0]['ville']}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,textAlign: TextAlign.end,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Image.asset('assets/images/icon_localisation.png',width: 30,),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Quartier',style: TextStyle(fontSize: 15),),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${dataUsersInfos[0]['quartier_etablissement']}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,textAlign: TextAlign.end),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Image.asset('assets/images/icon_localisation.png',width: 30,),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Itinéraire',style: TextStyle(fontSize: 15),),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${dataUsersInfos[0]['localisation']}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,textAlign: TextAlign.end),
                          ),
                        ),
                        Image.asset('assets/images/map-marked.png',color: Colors.blue,width: 20,)
                      ],
                    ),
                  ),
                ),
                dataUsersInfos[0]['type_prod'] != null ?
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(36, 158, 158, 158),
                        blurRadius: 5,
                        offset: Offset(1, 2),
                      ),
                      BoxShadow(
                        color: Color.fromARGB(54, 158, 158, 158),
                        blurRadius: 5,
                        offset: Offset(2, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ListTile(
                          leading: Text('Type de produit stocké',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          title: Divider(color: Colors.grey,thickness: 2,),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Card(
                              color: Colors.green,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('Ordinateur',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Card(
                              color: Colors.green,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('Tablette',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ) : Container(),
                Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text('Les dossiers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        title: Divider(color: Colors.grey,thickness: 2,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                Dossier(title:'Registre de commerce (Recto,Verso)',isCarte: true);
                              });
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Registre de commerce\n (Recto,Verso)')
                                  ],
                                ),
                                Image.asset('assets/images/folder.png',width: 80,),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                Dossier(title:"4 photos de l'etablissement",isCarte: false);
                              });
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("4 photos de l'etablissement")
                                  ],
                                ),
                                Image.asset('assets/images/folder.png',width: 80,),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70,bottom: 20),
                  child: Center(
                    child: Text('Inscrit le ${FormatDate(dataUsersInfos[0]['user_date_add'])}'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //////////////////////// function folder ////////////
  Dossier({
    required String title,
    required bool isCarte,
  }) {
    return showModalBottomSheet(
      constraints: const BoxConstraints(),
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10, left: 30, bottom: 10),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      child: Image.asset(
                        'assets/images/folder.png',
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(title)
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 30, left: 10, right: 10, bottom: 10),
                child: isCarte
                    ? Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Container(
                          child: Image.network(
                            '${FILE_FOURNISSEUR_PATH}/${dataUsersInfos[0]['registre_recto']}',
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Container(
                          child: Image.network(
                            '${FILE_FOURNISSEUR_PATH}/${dataUsersInfos[0]['registre_verso']}',
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('${FILE_FOURNISSEUR_PATH}/${dataUsersInfos[0]['siege_photo1']}'),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('${FILE_FOURNISSEUR_PATH}/${dataUsersInfos[0]['siege_photo2']}'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('${FILE_FOURNISSEUR_PATH}/${dataUsersInfos[0]['siege_photo3']}'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('${FILE_FOURNISSEUR_PATH}/${dataUsersInfos[0]['siege_photo4']}'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
