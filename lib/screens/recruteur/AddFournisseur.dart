// ignore_for_file: file_names, non_constant_identifier_names, unused_field, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/screens/recruteur/GerantBoutiqueScreen.dart';
import 'package:multiselect/multiselect.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../const/contants.dart';
class AddFournisseur extends StatefulWidget {
  const AddFournisseur({Key? key}) : super(key: key);

  @override
  State<AddFournisseur> createState() => _AddFournisseurState();
}

class _AddFournisseurState extends State<AddFournisseur> {
  final _formKey = GlobalKey<FormState>();
  List<String> typeProduits = ['Ordianteur', 'Tablette', 'Mode femme'];
  List<String> typeproduitstocke = [];
  bool _status_files = false;
  String ? selectedValueVille;
  ////////////////////// laoding files /////////
  File? imageRegistre1;
  File? imageRegistre2;
  File? pictureSiege1;
  File? pictureSiege2;
  File? pictureSiege3;
  File? pictureSiege4;

  TextEditingController NomEtablissementController = TextEditingController();
  TextEditingController NomQuartierController = TextEditingController();
  TextEditingController LocalisationController = TextEditingController();

  /////////////////////// get image encode ////////
  String ? imgRegistre1;
  String ? imgRegistre2;
  String ? Siege1;
  String ? Siege2;
  String ? Siege3;
  String ? Siege4;
  List<dynamic> villesItemlist = [];
  Future<void> getAllCitiesProduits() async {
    final response = await http.get(Uri.parse(getAllCities));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        villesItemlist  = jsonResponse;
        print(villesItemlist);
      });
    } else {
      throw Exception('Failed to load album');
    }
  }
  _getImages(int cunt) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        if(cunt == 1){
          imageRegistre1 = File(pickedFile.path);
        }else
        if(cunt == 2){
          imageRegistre2 = File(pickedFile.path);
        }else
        if(cunt == 3){
          pictureSiege1 = File(pickedFile.path);
        }else
        if(cunt == 4){
          pictureSiege2 = File(pickedFile.path);
        }else
        if(cunt == 5){
          pictureSiege3 = File(pickedFile.path);
        }else
        if(cunt == 6){
          pictureSiege4 = File(pickedFile.path);
        }
      });
    }
  }
  ///// photo registre de commerce /////////////

  ////////////// set images passagers ////////////
  void GetImageEncode() async{
    if(
    imageRegistre1 == null ||
        imageRegistre2==null ||
        pictureSiege1 ==null ||
        pictureSiege2 == null ||
        pictureSiege3 == null ||
        pictureSiege4 == null){
      Navigator.pop(context);
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        title: 'Oppp !!!',
        desc:   'Désolé, veuillez les images',
        btnOkOnPress: () {},
        btnOkColor: Colors.red
      )..show();
    }else{
      setState(()  {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>GerantBoutiqueScreen(
          NomEtablissement: NomEtablissementController.text.trim(),
          VilleSelected:selectedValueVille,
          NomQuartier: NomQuartierController.text.trim(),
          Localisation: LocalisationController.text.trim(),
          typeProduitsStocke:typeproduitstocke,
          registre1: imageRegistre1?.path,
          registre2:imageRegistre2?.path,
          siege1:pictureSiege1?.path,
          siege2:pictureSiege2?.path,
          siege3:pictureSiege3?.path,
          siege4:pictureSiege4?.path,
        )));
      });
    }
  }
@override
  void initState() {
    // TODO: implement initState
  getAllCitiesProduits();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  grey,
        elevation: 0,
        title: Text('Ajouter un fournisseur',style: TextStyle(color: Colors.black),),
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
                  child:Form(
                    key: _formKey,
                    child:  Column(
                      children: <Widget> [
                        Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 12,bottom: 12),
                              child: Text("Information sur l'étalissement",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            )
                        ),
                        SizedBox(height: 30,),

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
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(fontSize: 18),
                                    controller: NomEtablissementController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.home,),
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Nom de l'établisement",
                                        labelStyle: TextStyle(fontSize: 18),
                                        contentPadding: const EdgeInsets.all(14),
                                        border: const OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Colors.grey, width: 0.5)
                                        )
                                    ),
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Ce champs est réquis';
                                      }
                                      return null;
                                    },
                                  ),
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
                                  margin: EdgeInsets.only(right: 1),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          offset: Offset(0.5, 0.5),
                                          color: Colors.white),
                                    ],
                                  ),
                                  child:DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          contentPadding: const EdgeInsets.all(14),
                                          border: const OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(5.0),
                                              borderSide: BorderSide(color: Colors.grey, width: 0.5)
                                          )
                                      ),
                                      validator: (value) {
                                          return value == 'A' ? 'Ce champs est réquis': null;
                                      },
                                      value: selectedValueVille,
                                      icon: Icon(Icons.expand_more),
                                      onChanged: (String? newValue){
                                        setState(() {
                                          selectedValueVille = newValue!;
                                        });

                                      },
                                      items: villesItemlist.map((item) {
                                        return  DropdownMenuItem(
                                            child: Text("${item['nom']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                            value: "${item['id']}"
                                        );
                                      }).toList()
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 6),
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
                                    controller: NomQuartierController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Nom du quartier",
                                        labelStyle: TextStyle(fontSize: 16),
                                        contentPadding: const EdgeInsets.all(14),
                                        border: const OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Colors.grey, width: 0.5)
                                        )
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Ce champs est réquis';
                                      }
                                      return null;
                                    },
                                  ),
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
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    controller: LocalisationController,
                                    style: const TextStyle(fontSize: 14),
                                    decoration: InputDecoration(
                                        suffixIcon:InkWell(
                                            onTap:(){},
                                            child: Icon(Icons.map,color: Colors.blue,size: 30,)
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Indiquer votre localisation",
                                        labelStyle: TextStyle(fontSize: 18),
                                        focusColor: Colors.black,
                                        contentPadding: const EdgeInsets.all(18),
                                        border: const OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Colors.grey, width: 0.5)
                                        )

                                    ),
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Ce champs est réquis';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 12,
                              right: 12,
                              left: 12
                          ),
                          child: Container(
                            child: Column(
                              children:<Widget> [
                                Row(
                                  children: <Widget> [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          InkWell(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(1),
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    offset: const Offset(1, 1),
                                                  ),
                                                ],
                                                border: const Border(
                                                  bottom: BorderSide(
                                                    width: 1,
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  DropDownMultiSelect(
                                                    options: typeProduits,
                                                    selectedValues: typeproduitstocke,
                                                    decoration: InputDecoration(
                                                        filled: true,
                                                        contentPadding: const EdgeInsets.all(14),
                                                        border: const OutlineInputBorder(),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius:BorderRadius.circular(5.0),
                                                            borderSide: BorderSide(color: Colors.white, width: 0.5)
                                                        )
                                                    ),
                                                    hint: Padding(
                                                      padding: EdgeInsets.all(20.0),
                                                      child: Text(
                                                        "Type de produits stokés",
                                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),
                                                      ),
                                                    ),
                                                    onChanged: (value) {
                                                      print('selected fruit $value');
                                                      setState(() {
                                                        typeproduitstocke = value;
                                                      });
                                                      print('you have selected $typeproduitstocke fruits.');
                                                    },
                                                    whenEmpty: 'Type de produits stokés',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Container(
                              padding: EdgeInsets.all(20),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                          "Registre de commerce",
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text('Image 1/2',style: TextStyle(fontWeight: FontWeight.bold),),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 23),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 7,
                                                child: InkWell(
                                                  onTap: (){
                                                    _getImages(1);
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(right: 12),
                                                    child: imageRegistre1 == null ?
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
                                                          image: FileImage(imageRegistre1!),
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
                                                  onTap: (){
                                                    _getImages(2);
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(right: 12),
                                                    child: imageRegistre2 == null ?
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
                                                          image: FileImage(imageRegistre2!),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                     Container(
                                       child:  _status_files ?
                                       Text('sdqs') :
                                       Container(),
                                     )
                                    ],
                                  )
                                ],
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                          "4 photos de votre siège",
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text('Image 1/4',style: TextStyle(fontWeight: FontWeight.bold),),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                            child:InkWell(
                                              onTap: (){
                                                _getImages(3);
                                              },
                                              child:  Padding(
                                                padding: EdgeInsets.only(left: 6),
                                                child: pictureSiege1 == null ?
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
                                                )
                                                    :  Container(
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
                                                    image: DecorationImage(
                                                      image: FileImage(pictureSiege1!),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),
                                        Expanded(
                                            child: InkWell(
                                              onTap: (){
                                                _getImages(4);
                                              },
                                              child:  Padding(
                                                padding: EdgeInsets.only(left: 6),
                                                child: pictureSiege2 == null ?
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
                                                )
                                                    :  Container(
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
                                                    image: DecorationImage(
                                                      image: FileImage(pictureSiege2!),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),
                                        Expanded(
                                            child: InkWell(
                                              onTap: (){
                                                _getImages(5);

                                              },
                                              child:  Padding(
                                                padding: EdgeInsets.only(left: 6),
                                                child: pictureSiege3 == null ?
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
                                                )
                                                    :  Container(
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
                                                    image: DecorationImage(
                                                      image: FileImage(pictureSiege3!),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),
                                        Expanded(
                                            child: InkWell(
                                              onTap: ()=> _getImages(6),
                                              child:  Padding(
                                                padding: EdgeInsets.only(left: 6),
                                                child: pictureSiege4 == null ?
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
                                                )
                                                    :  Container(
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
                                                    image: DecorationImage(
                                                      image: FileImage(pictureSiege4!),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),

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
                            height: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                primary: Colors.white,
                                backgroundColor: blue,
                              ),
                              onPressed: () {
                                //ajouterFournisseur();
                                if(_formKey.currentState!.validate()){
                                  showAlertDialogConnexion(context);
                                  new Timer(const Duration(seconds: 5), () {
                                    //Navigator.pop(context);
                                    GetImageEncode();
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Enregister',
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
                    )
                ),
              )
            ],
          )



      ),
    );
  }
}

void showAlertDialogConnexion(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(color: blue,),
        Container(margin: EdgeInsets.only(left: 5),child:Text("Réquette en cours", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}