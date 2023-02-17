import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/components/input/InputEmail.dart';
import 'package:daymonde_collaboration/components/input/InputPhoneNumber.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/screens/recruteur/ProfileScreen.dart';
import 'package:daymonde_collaboration/services/fournisseur_services.dart';
import 'package:daymonde_collaboration/services/image_encode.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class GerantBoutiqueScreen extends StatefulWidget {
  const GerantBoutiqueScreen({
    Key? key,
    required this.NomEtablissement,
    required this.VilleSelected,
    required this.NomQuartier,
    required this.Localisation,
    required this.typeProduitsStocke,
    required this.registre1,
    required this.registre2,
    required this.siege1,
    required this.siege2,
    required this.siege3,
    required this.siege4,
  }) : super(key: key);
  final NomEtablissement;
  final VilleSelected;
  final NomQuartier;
  final Localisation;
  final typeProduitsStocke;
  final registre1;
  final registre2;
  final siege1;
  final siege2;
  final siege3;
  final siege4;
  @override
  State<GerantBoutiqueScreen> createState() => _GerantBoutiqueScreenState();
}

class _GerantBoutiqueScreenState extends State<GerantBoutiqueScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController NomController = TextEditingController();
  TextEditingController PrenomsController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController ProfessionController = TextEditingController();
  File? _imageRecto;
  File? _imageVerso;
  /////////////////////// get image encode ////////
  String ? CarteRecto;
  String ? CarteVerso;
  _getImages(int cunt) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        if(cunt == 1){
          _imageRecto = File(pickedFile.path);
        }else
        if(cunt == 2){
          _imageVerso = File(pickedFile.path);
        }
      });
    }
  }

  void AddFournisseur() async{
    showAlertDialogDemande(context);
    new Timer(const Duration(seconds: 5), () async {
      //String type_produit_vendu = widget.typeProduitsStocke[0]+','+widget.typeProduitsStocke[1]+','+widget.typeProduitsStocke[2];
      ApiResponse response = await AddFournisseurRequest(
        NomController.text.trim(),
        PrenomsController.text.trim(),
        PhoneNumberController.text.trim(),
        widget.VilleSelected,
        ProfessionController.text.trim(),
        EmailController.text.trim(),
        PhoneNumberController.text.trim(),
        widget.NomEtablissement,
        widget.Localisation,
        widget.NomQuartier,
        widget.registre1,
        widget.registre2,
        widget.siege1,
        widget.siege2,
        widget.siege3,
        widget.siege4,
      );
      if(response.error == null && StatusCode == 200){
        Navigator.pop(context);
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          title: 'Fournisseur ajouté',
          desc:   'redirection en cours.......',
          btnOkOnPress: () {},
        )..show();
        new Timer(const Duration(seconds: 5), () async {
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
          });
        });
      }else{
        Navigator.pop(context);
        AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.error,
            title: 'Oopp !!!',
            desc:   '${response.error}',
            btnOkOnPress: () {},
            btnOkColor: Colors.red
        )..show();

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  grey,
        elevation: 0,
        title: Text('Ajouter in fournisseur',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    grey,
                    Colors.white10,
                    Colors.white,
                    grey,
                    Colors.white,
                  ]
              )
          ),
          child: ListView(
            children: <Widget> [
              Column(
                children: [
                  Container(
                    child: Image.asset('assets/images/add_fournisseur.png'),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: MediaQuery.of(context).size.width *0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 6,
                        blurRadius: 7,
                        offset: Offset(1, 6),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget> [
                        Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 12,bottom: 12),
                              child: Text("Information sur le gérant",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            )
                        ),
                        SizedBox(height: 30,),

                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8,
                              right: 8,
                              left: 8
                          ),
                          child:Container(
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
                              controller: NomController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person,),
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Nom",
                                  labelStyle: TextStyle(fontSize: 16),
                                  contentPadding: const EdgeInsets.all(16),
                                  border: const OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(5.0),
                                      borderSide: BorderSide(color: Colors.grey, width: 0.5)
                                  )
                              ),

                              validator: (value) {
                                if(value!.isEmpty){
                                  return "Ce champ st réquis";
                                }else{
                                  return null ;
                                }

                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8,
                              right: 8,
                              left: 8
                          ),
                          child:Container(
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
                              controller: PrenomsController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person,),
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Prenoms",
                                  labelStyle: TextStyle(fontSize: 16),
                                  contentPadding: const EdgeInsets.all(16),
                                  border: const OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(5.0),
                                      borderSide: BorderSide(color: Colors.grey, width: 0.5)
                                  )
                              ),

                              validator: (value) {
                                if(value!.isEmpty){
                                  return "Ce champ st réquis";
                                }else{
                                  return null ;
                                }

                              },
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8,
                              right: 8,
                              left: 8
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
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
                                  child:InputPhoneNumber(
                                    PhoneNumberController: PhoneNumberController,
                                    Label: "Numéro de téléphone",),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8,
                              right: 8,
                              left: 8
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
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
                                    child: InputEmail(
                                      EmailController:EmailController,
                                      Label: 'Adresse mail',
                                    )

                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8,
                              right: 8,
                              left: 8
                          ),
                          child:Container(
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
                              controller: ProfessionController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.work,),
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Profession",
                                  labelStyle: TextStyle(fontSize: 16),
                                  contentPadding: const EdgeInsets.all(16),
                                  border: const OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(5.0),
                                      borderSide: BorderSide(color: Colors.grey, width: 0.5)
                                  )
                              ),

                              validator: (value) {
                                if(value!.isEmpty){
                                  return "Ce champ st réquis";
                                }else{
                                  return null ;
                                }

                              },
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0.5, 0.5),
                                  ),
                                ],

                              ),
                              child: Column(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          "Photo CNI, passeport,attestation ou permis de conduire (Recto Verso)",
                                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 23),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 7,
                                            child: InkWell(
                                              onTap: ()=> _getImages(1) ,
                                              child: Padding(
                                                padding: EdgeInsets.only(right: 12),
                                                child: _imageRecto == null ?
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                                  height: 80,
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
                                                ):
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(1),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        offset: const Offset(0.5, 0.5),
                                                      ),
                                                    ],
                                                    image: DecorationImage(
                                                      image: FileImage(_imageRecto!),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),
                                        Expanded(
                                            flex: 7,
                                            child: InkWell(
                                              onTap: ()=> _getImages(2) ,
                                              child: Padding(
                                                padding: EdgeInsets.only(right: 12),
                                                child: _imageVerso == null ?
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                                  height: 80,
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
                                                ):
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                                  height: 80,
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
                                                    image: DecorationImage(
                                                      image: FileImage(_imageVerso!),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.all(20),
                          child: SizedBox(
                            width: size.width,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                primary: Colors.white,
                                backgroundColor: blue,
                              ),

                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                  AddFournisseur();
                                }
                                /*showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      contentPadding: const EdgeInsets.only(top: 10.0),
                                      title:  Container(
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text('Inscription reussie',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                            Center(
                                              child: SizedBox(
                                                width: 50,
                                                child: Divider(color: blue,thickness: 2,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      content: Container(
                                        width: 300.0,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(text: 'Nous avons envoyé des coordonnées de connexion au gérant par ',style: TextStyle(color:Colors.black)),
                                                    TextSpan(text: 'sms ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                                                    TextSpan(text: 'au',style: TextStyle(color:Colors.black)),
                                                    TextSpan(text: ' 07 59 02 85 45 \n',style: TextStyle(color: blue,fontWeight: FontWeight.bold)),
                                                    TextSpan(text: 'pour valider votre collaboration !',style: TextStyle(color:Colors.black)),
                                                  ])),
                                            ),
                                            SizedBox(height: 20,),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    TextButton(
                                                      onPressed: ()=> null,
                                                      child: Text('* Changer de numéro ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    TextButton(
                                                      onPressed: ()=> null,
                                                      child: Text('* Renvoyer le message ',style:TextStyle(fontWeight: FontWeight.bold,color: blue)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            InkWell(
                                              onTap: () =>null,
                                              child: Container(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 10.0, bottom: 10.0),
                                                decoration: const BoxDecoration(
                                                  color: blue,
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(20.0),
                                                      bottomRight: Radius.circular(20.0)),
                                                ),
                                                child: const Text(
                                                  "Terminer",
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }); */
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Valider',
                                  style: TextStyle(
                                    fontSize: (18),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )



      ),
    );
  }
}
void showAlertDialogDemande(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(color: blue,),
        Container(margin: EdgeInsets.only(left: 5),child:Text("Demande en cours", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}