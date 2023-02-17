// ignore_for_file: file_names, unused_import, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously, override_on_non_overriding_member
import 'dart:async';
import 'dart:io';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/screens/LaoderScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/auth/code_confirme_recruteur.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/components/DefaultButton.dart';
import 'package:daymonde_collaboration/components/TextFIeldContainer.dart';
import 'package:daymonde_collaboration/components/fournisseur/textFielsInput.dart';
import 'package:daymonde_collaboration/screens/fournisseur/homeFournisseur.dart';
import 'package:daymonde_collaboration/services/fournisseur_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daymonde_collaboration/components/input/CostumInput.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

import '../../../functions.dart';
import '../../../models/apiReponse.dart';
import '../../../models/dataInfosGerants.dart';
import '../../../models/user_model.dart';
import '../../input/CountryPicker.dart';
import '../../input/InputEmail.dart';
import '../../input/InputPassword.dart';
import '../../input/InputPhoneNumber.dart';



class RegisterFournisseurForm extends StatefulWidget {
  const RegisterFournisseurForm({Key? key}) : super(key: key);

  @override
  State<RegisterFournisseurForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterFournisseurForm> {
  String selectedValue = "default";
  String ? villeSelected;
  File? photo_profile;
  _getImages(int cunt) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        if(cunt == 1){
          photo_profile = File(pickedFile.path);
        }
      });
    }
  }
  bool isloading = true;
  bool suivantForm = false;
  String error = '';
  final _formKey = GlobalKey<FormState>();
  List<dynamic> villestItemlist = [];
  //text editing controller for text field
  Future<void> getAllVille() async {
    final response = await http.get(Uri.parse(getAllCities));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        villestItemlist  = jsonResponse;
        isloading = false;
        print(villestItemlist);
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  TextEditingController PasswordControler = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController NomController = TextEditingController();
  TextEditingController PrenomController = TextEditingController();
  TextEditingController ProfessionController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController countryValue = TextEditingController();
  TextEditingController nomBoutiqueController = TextEditingController();
  TextEditingController QuartierBoutiqueController = TextEditingController();
  bool remember = false;
  @override

  void RegisterParrain() async {
    showAlertDialogDemande(context);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(EmailController.text);
    new Timer(const Duration(seconds: 5), () async {
      //String type_produit_vendu = widget.typeProduitsStocke[0]+','+widget.typeProduitsStocke[1]+','+widget.typeProduitsStocke[2];
      ApiResponse response = await FournisseurAddRequest(
          NomController.text.trim(),
          PrenomController.text.trim(),
          PhoneNumberController.text.trim(),
         '${photo_profile?.path}',
          '${villeSelected}',
          ProfessionController.text.trim(),
          EmailController.text.trim(),
          PasswordControler.text.trim(),
          nomBoutiqueController.text.trim(),
          '${villeSelected}',
          QuartierBoutiqueController.text.trim(),
      );
      if(response.error == null && StatusCode == 200){
        pref.setString('${EmailController.text}' ,'VERIF_EMAIL');
        pref.setString('VERIF_STATUS','VERIF_STATUS');
        Navigator.pop(context);
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          title: 'Votre compte a été créé',
          desc:   'redirection en cours.......',
          btnOkOnPress: () {},
        )..show();
        new Timer(const Duration(seconds: 3), () async {
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ValisationCompteRecruteurScreen(code_otp: null)));
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
  void initState() {
    // TODO: implement initState
    getAllVille();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: isloading ? LoaderPageScreen() : Column(
        children: [
          suivantForm == false ?
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text("créer votre compte".toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: ()=>_getImages(1),
                                child: photo_profile == null ?
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
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
                                )
                                    :
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
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
                                          image: FileImage(photo_profile!),
                                        fit: BoxFit.cover
                                      )
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                child: Text('Ajouter une photo'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 5,
                            ),
                            child: TextFieldContainer(
                              child: CostumInputFiels(
                                  Controller: PrenomController,Icon: Text(''),
                                  Label: "Prénom"),
                            ),
                          )),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: TextFieldContainer(
                              child: CostumInputFiels(
                                Controller: NomController,
                                Label: "Nom de famille",
                                Icon:Text(''),
                              ),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      children: [
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 5,
                              ),
                              child: CountryPicker(
                                countryValue: countryValue,
                              ),
                            )),
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: DropdownButtonFormField(
                                hint: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("Ville",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.all(12),
                                    border: const OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:BorderRadius.circular(5.0),
                                        borderSide: BorderSide(color: Colors.grey, width: 0.2)
                                    )
                                ),
                                validator: (Value) => Value == null ? "Champs est réquis" : null,
                                value: villeSelected,
                                icon: Icon(Icons.expand_more),
                                items: villestItemlist.map((item) {
                                  return  DropdownMenuItem(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text("${item['nom']}"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      value: "${item['id']}"
                                  );
                                }).toList(),
                                onChanged: (Value){
                                  setState(() {
                                    villeSelected = Value as String?;
                                  });
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child:TextFieldContainer(
                      child: CostumInputFiels(
                          Controller: ProfessionController,
                          Label: 'Profession',
                          Icon:Text('')
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InputPhoneNumber(
                      PhoneNumberController: PhoneNumberController,
                      Label: "Numéro de téléphone",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CostumInputFiels(
                        Controller: EmailController,
                        Label: 'Entrez votre Email',
                        Icon: Icon(Icons.email)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: DefaultButton(
                      text: "Suivant",
                      press: (){

                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            showAlertDialogConnexion(context);
                            new Timer(const Duration(seconds: 5), () {
                              setState(() async {
                                Navigator.pop(context);
                                suivantForm = ! suivantForm;
                              });
                            });
                          }
                        });
                      },
                    ),
                  ),

                ],
              ))
              :
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text("créer votre compte".toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: ()=>_getImages(1),
                                child: photo_profile == null ?
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
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
                                )
                                    :
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
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
                                          image: FileImage(photo_profile!),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                child: Text('Changer ma photo'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InputPassword(
                      PasswordControler: PasswordControler,
                      Label: ' Mot de passe',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InputPassword(
                      PasswordControler: PasswordControler,
                      Label: 'Entrez à nouneau le mot de passe',
                    ),
                  ),
                 Padding(
                   padding: EdgeInsets.only(bottom: 15),
                   child:  Container(
                     margin: EdgeInsets.only(right: 1),
                     height: 55,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(8),
                     ),
                     child:DropdownButtonFormField(
                         dropdownColor: Colors.white,
                         decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             contentPadding: const EdgeInsets.all(18),
                             border: const OutlineInputBorder(),
                             enabledBorder: OutlineInputBorder(
                                 borderRadius:BorderRadius.circular(5.0),
                                 borderSide: BorderSide(color: Colors.grey, width: 0.5)
                             )
                         ),
                         validator: (value) => value == null ? "Select a country" : null,
                         value: selectedValue,
                         icon: Icon(Icons.expand_more,color: Colors.black,),
                         onChanged: (newValue){
                           setState(() {
                             selectedValue = newValue as String;
                           });
                         },
                         items: [
                           DropdownMenuItem(
                               child: Text("Je suis un",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: 'Times New Roman'),),
                               value: "default"
                           ),
                           DropdownMenuItem(
                               child: Text("particilier"),
                               value: "particilier"
                           ),
                           DropdownMenuItem(
                               child: Text("Une boutique"),
                               value: "Une boutique"
                           ),
                         ]
                     ),
                   ),
                 ),
               selectedValue == "Une boutique" ?
               Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(right: 5,top: 10),
                     child: TextFieldContainer(
                       child: CostumInputFiels(
                           Controller: nomBoutiqueController,
                           Icon: Text(''),
                           Label: "Nom de la boutique"),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 5.0,top: 10),
                     child: TextFieldContainer(
                       child: CostumInputFiels(
                           Icon: Text(''),
                           Controller: QuartierBoutiqueController,
                           Label: "Quartier de la boutique"),
                     ),
                   )
                 ],
               )
                   : Container(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Flexible(
                                child: Checkbox(
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  value: remember,
                                  activeColor: blue,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      remember = !remember;
                                    });
                                  },
                                ),
                              ),
                              const Text("Se souvenir de moi"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: DefaultButton(
                        text: "Enregistrer",
                      press: remember ? () {
                        if (_formKey.currentState!.validate()) {
                          RegisterParrain();
                        }
                      } : null ,
                    ),
                  ),

                ],
              )),
        ],
      ),
    );
  }
}


void openMyAlertDialog(BuildContext context)  {
  // Create a AlertDialog.
  AlertDialog dialog = AlertDialog(
    title: Text("Confirmez la collaboration",textAlign: TextAlign.center,),
    content: Padding(
      padding: EdgeInsets.all(5),
      child:  RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Cliquez sur  ',
          style: DefaultTextStyle.of(context).style,
          children: const <TextSpan>[
            TextSpan(text: 'OK', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
            TextSpan(text: ' pour confimer la collaboration avec Mr. '),
            TextSpan(text: 'Michael k...',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
          ],
        ),
      ),
    ),
    actions: [
      Divider(color: Colors.grey,),
     Center(
       child: ElevatedButton(
           child: SizedBox(
             width: MediaQuery.of(context).size.width *0.2,
             child: Text("Ok",textAlign: TextAlign.center,),
           ),
           onPressed: (){
             Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>HomeFournisseur()));
           }
       ),
     )
    ],
  );
  // Call showDialog function.
  Future futureValue = showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      }
  );
  futureValue.then( (value) {
    print("Return value: " + value.toString()); // true/false
  });
}

void showAlertDialogConnexion(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(color: blue,),
        Container(margin: EdgeInsets.only(left: 5),child:Text("Connexion en cours", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}

void showAlertDialogDemande(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(color: blue,),
        Container(margin: EdgeInsets.only(left: 5),child:Text("Requette en cours", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}