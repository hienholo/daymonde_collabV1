import 'package:daymonde_collaboration/components/DefaultButton.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/notifications/mission_ok_screen.dart';
import 'package:flutter/material.dart';
class AjouterNouvelleMissionScreen extends StatefulWidget {
  const AjouterNouvelleMissionScreen({Key? key}) : super(key: key);

  @override
  State<AjouterNouvelleMissionScreen> createState() => _AjouterNouvelleMissionScreenState();
}

class _AjouterNouvelleMissionScreenState extends State<AjouterNouvelleMissionScreen> {
  String fournisseurInfos = 'INFORMATION DU FOURNISSEUR';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: ()=>Navigator.pop(context),
            child: Icon(Icons.chevron_left,color: Colors.black,)
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Nouvelle Mission\n",style: TextStyle(color: black,fontWeight: FontWeight.bold,fontSize: 13)),
                  TextSpan(text: "En cours",style: TextStyle(color: black,fontSize: 13)),
                ]
            )),
            Text("Affichage du compte à robot",style: TextStyle(color: Colors.red,fontSize: 12),),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text('Ajouter 8 images du produit',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.1),
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset: const Offset(0.5, 0.5),
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/icon_photo.png'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0.5, 0.5),
                            color: Colors.grey),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Nom de l'article",
                          labelStyle: TextStyle(fontSize: 18),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(18),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey, width: 0.5)
                          )

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0.5, 0.5),
                            color: Colors.grey),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Selectionner la catégorie",
                          labelStyle: TextStyle(fontSize: 18),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(18),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey, width: 0.5)
                          )

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0.5, 0.5),
                            color: Colors.grey),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 8,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Description",
                          labelStyle: TextStyle(fontSize: 18),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(18),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey, width: 0.5)
                          )

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0.5, 0.5),
                            color: Colors.grey),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Selectionner le produit",
                          labelStyle: TextStyle(fontSize: 18),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(18),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey, width: 0.5)
                          )

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0.5, 0.5),
                            color: Colors.grey),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Localisation du produit",
                          labelStyle: TextStyle(fontSize: 18),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(18),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey, width: 0.5)
                          )

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0.5, 0.5),
                            color: Colors.grey),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Prix du produit",
                          labelStyle: TextStyle(fontSize: 18),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(18),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey, width: 0.5)
                          )

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.blue,
                          filled: true,
                          contentPadding: const EdgeInsets.all(14),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey, width: 0.2)
                          )
                      ),
                      validator: (value) => value == null ? "Type de services" : null,
                      value: fournisseurInfos,
                      icon: Icon(Icons.expand_more),
                      onChanged: (String? newValue){
                        setState(() {
                          fournisseurInfos = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                            child: Row(
                              children: [
                                Text("INFORMATION DU FOURNISSEUR",style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                            value: "INFORMATION DU FOURNISSEUR"
                        ),
                        DropdownMenuItem(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.asset('assets/profil/8.png',width: 40,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text("NOM DU RESPONSABLE"),
                                ),
                              ],
                            ),
                            value: "Fourgonnette 4 roues"
                        ),
                        DropdownMenuItem(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.asset('assets/profil/6.png',width: 40,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text("MICHAEL KOUAMÉ"),
                                ),
                              ],
                            ),
                            value: "MICHAEL KOUAMÉ"
                        ),
                        DropdownMenuItem(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.asset('assets/profil/11.png',width: 40,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text("AMANI ECRIC"),
                                ),
                              ],
                            ),
                            value: "AMANI ECRIC"
                        ),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0.5, 0.5),
                            color: Colors.grey),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Nom du Fournisseur",
                          labelStyle: TextStyle(fontSize: 18),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(18),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey, width: 0.5)
                          )

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0.5, 0.5),
                            color: Colors.grey),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Contact 1",
                          labelStyle: TextStyle(fontSize: 18),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(18),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey, width: 0.5)
                          )

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0.5, 0.5),
                            color: Colors.grey),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Contact 2",
                          labelStyle: TextStyle(fontSize: 18),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(18),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey, width: 0.5)
                          )

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0,bottom: 20),
                  child: DefaultButton(text:" Enregistrer",
                    press: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>MissionOkeyScreen()));
                    },
                    couleur: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}
