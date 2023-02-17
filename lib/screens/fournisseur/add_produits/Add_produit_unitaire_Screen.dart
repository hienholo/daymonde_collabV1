import 'dart:async';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/models/categories_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:daymonde_collaboration/components/fournisseur/Nume_whatsapp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/fournisseur_services.dart';


class AjoutprodruitRecruUnitaireScreen extends StatefulWidget {
  const AjoutprodruitRecruUnitaireScreen({Key? key}) : super(key: key);

  @override
  State<AjoutprodruitRecruUnitaireScreen> createState() => _AjoutprodruitRecruUnitaireScreenState();
}

class _AjoutprodruitRecruUnitaireScreenState extends State<AjoutprodruitRecruUnitaireScreen> {
//
  final _formKey = GlobalKey<FormState>();
bool choosFile =false;
  List<XFile>? _imageFileList = [];
  Future _getImage() async {
    final List<XFile> imagePicker = await ImagePicker().pickMultiImage(
      imageQuality: 50,
    );
    if (imagePicker.length == 8) {
      setState(() {
        _imageFileList!.addAll(imagePicker);
      });
    } else {
      choosFile = true;
    }
  }
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _localisationController = TextEditingController();
  final TextEditingController _quantiteController = TextEditingController();
  final TextEditingController _prixofficielController = TextEditingController();
  final TextEditingController _prixpartenaireController = TextEditingController();
  final TextEditingController _NumWhatssappController = TextEditingController();
  String ? dropdowncategorie;
  String ? dropdownsouscategorie;
  String ? etatproduit;
  ////////////////// get function all categories /////////
  List<dynamic> categoryItemlist = [];
  List<dynamic> souscategoryItemlist = [];
  List<dynamic> etatItemlist = [];
  //text editing controller for text field
  Future<void> getAllCategories() async {
    final response = await http.get(Uri.parse(CategoriesProducts));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['categories'];
      setState(() {
        categoryItemlist  = jsonResponse;
      });
    } else {
      throw Exception('Failed to load album');
    }
  }
  Future<void> getAllSousCategories() async {
    final response = await http.get(Uri.parse("${SousCategoriesProducts}?categorie_id=${dropdowncategorie}"));
    if (response.statusCode == 200) {
      var jsonResponse  = json.decode(response.body);
      setState(() {
        souscategoryItemlist = jsonResponse;
      });
    } else {
      throw Exception('Failed to load ');
    }
  }
Future<void> getEtatProduits() async {
  final response = await http.get(Uri.parse(CategoriesProducts));
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body)['etats'];
    setState(() {
      etatItemlist  = jsonResponse;
    });
  } else {
    throw Exception('Failed to load album');
  }
}

////////////////////// function add product ///////////////
  Future<void> AddProductFournisseur()async{
    showAlertDialogDemande(context);
    new Timer(const Duration(seconds: 5), () async {
      //String type_produit_vendu = widget.typeProduitsStocke[0]+','+widget.typeProduitsStocke[1]+','+widget.typeProduitsStocke[2];
      ApiResponse response = await AddProduitsFournisseur(
          _nomController.text.trim(),
          _descriptionController.text.trim(),
          '${dropdownsouscategorie}',
          _quantiteController.text.trim(),
          '${etatproduit}',
          _prixofficielController.text.trim(),
          _prixpartenaireController.text.trim(),
          _localisationController.text.trim(),
          _prixpartenaireController.text.trim(),
          '${_imageFileList![0].path}',
          '${_imageFileList![1].path}',
          '${_imageFileList![2].path}',
          '${_imageFileList![3].path}',
          '${_imageFileList![4].path}',
          '${_imageFileList![5].path}',
          '${_imageFileList![6].path}',
          '${_imageFileList![7].path}');
      if(response.error == null && StatusCode == 200){
        Navigator.pop(context);
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          title: 'Connexion reussie',
          desc:   'redirection en cours.......',
          btnOkOnPress: () {},
        )..show();
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
    // TODO: implement initStateobject
    getAllCategories();
    getEtatProduits();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        title: const Text('Ajouter un produit'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text('Ajouter 8 images'),
                ),
                const SizedBox(
                  height: 10,
                ),
                //ajout images
                Text('${_imageFileList!.length}/8'),
                choosFile ? Container(): Text('Vueillez selectionner 08 images',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16),),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          _getImage();
                        },
                        icon: const Icon(
                          Icons.wallpaper,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GridView.builder(
                            itemCount: _imageFileList!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Image.file(File(_imageFileList![index].path),
                                  fit: BoxFit.cover, width: 230, height: 230);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //nom article
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: _nomController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Nom de larticle",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Le champs ne peut pas être vide';
                      }
                      return null;
                    },
                  ),
                ),

                //description
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _descriptionController,
                    maxLines: 10,
                    minLines: 5,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Description',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusColor: Colors.yellow,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Le champs ne peut pas être vide';
                      }
                      return null;
                    },
                  ),
                ),

                //Localisation
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: _localisationController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "Localisation du produit",
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Le champs ne peut pas être vide';
                      }
                      return null;
                    },
                  ),
                ),

                //
                // categorie et sous categorie
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          validator: (value) {
                            return value == null ? 'Ce champs est réquis': '';
                          },
                          isExpanded: true,
                          itemHeight: 60,
                          items: categoryItemlist.map((item) {
                            return  DropdownMenuItem(
                                child: Row(
                                  children: [
                                    //Image.asset('assets/images/city.png',width: 30,),
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
                          onChanged: (newValeur) {
                            setState(() {
                              dropdowncategorie = newValeur as String;
                              getAllSousCategories();
                            });
                          },

                        ),
                      ),
                    ),
                  ],
                ),
                souscategoryItemlist.length >0 ?
                Row(
                  children:  [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 6, top: 15),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: "Selectionner une catégorie",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            label:  Row(
                              children: [
                                //Image.asset('assets/images/city.png',width: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("villes"),
                                  ),
                                ),
                              ],
                            )
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          validator: (value) {
                            return value == null ? 'Ce champs est réquis': '';
                          },
                          isExpanded: true,
                          itemHeight: 60,
                          items: souscategoryItemlist.map((item) {
                            return  DropdownMenuItem(
                                child: Row(
                                  children: [
                                    //Image.asset('assets/images/city.png',width: 30,),
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
                          onChanged: (String? newValeur) {
                            setState(() {
                              dropdownsouscategorie = newValeur as String;
                            });
                          },
                        ),
                      ),
                    ),

                  ])  :
                Container(),
                //
                // etat et quantité produit etatItemlist
                Row(
                  children: [
                    //etat du produit
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 4,
                        ),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          hint: Text('Etat du produit', style: const TextStyle(fontSize: 14),),
                          icon: const Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          isExpanded: true,
                          validator: (value) {
                            return value == null ? 'Ce champs est réquis': '';
                          },
                          items:  etatItemlist.map((item) {
                            return  DropdownMenuItem(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Text("${item['nom']}"),
                                ),
                                value: "${item['id']}"
                            );
                          }).toList(),
                          onChanged: (newValeur) {
                            setState(() {
                              dropdowncategorie = newValeur as String;
                            });
                          },
                        ),
                      ),
                    ),

                    //Quantité
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 4,
                        ),
                        child: TextFormField(
                          controller: _quantiteController,
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Quantité",
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champs ne peut pas être vide';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                //Prix officiel
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: _prixofficielController,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Prix officiel",
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ),
                ),
                //Prix partenaire
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: _prixpartenaireController,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Prix partenaire",
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Le champs ne peut pas être vide';
                      }
                      return null;
                    },
                  ),
                ),
                //contact whatsApp
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InputPhoneNumberScreen(
                      Label: 'Numéro WhatsApp du gérant',
                      PhoneNumberController: _NumWhatssappController,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(236, 3, 61, 150),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){

                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Enregistrer",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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