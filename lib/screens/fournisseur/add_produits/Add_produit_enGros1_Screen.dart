import 'package:flutter/material.dart';

import 'Add_produit_enGros2_Screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AjoutprodruitenRecuGrosScreen extends StatefulWidget {
  const AjoutprodruitenRecuGrosScreen({super.key});

  @override
  State<AjoutprodruitenRecuGrosScreen> createState() =>
      _AjoutprodruitenGrosScreenState();
}

class _AjoutprodruitenGrosScreenState extends State<AjoutprodruitenRecuGrosScreen> {
  final _formkey = GlobalKey<FormState>();

  List<XFile>? _imageFileList = [];

  Future _getImage() async {
    final List<XFile> imagePicker = await ImagePicker().pickMultiImage(
      imageQuality: 50,
    );
    if (imagePicker.length <= 8) {
      setState(() {
        _imageFileList!.addAll(imagePicker);
      });
    } else {

    }
  }

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _localisationController = TextEditingController();

  final TextEditingController _quantiteController = TextEditingController();

  String dropdowncategorie = '';
  String etatproduit = '';

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

              Form(
                key: _formkey,
                child: Column(
                  children: [
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
                      ),
                    ),

                    //description
                    Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(top: 10, left: 2, right: 2),
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
                    Container(
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
                                label: const Text(
                                  'Selectionnez une catégories',
                                  style: TextStyle(),
                                ),
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
                              icon: const Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                              isExpanded: true,
                              itemHeight: 60,
                              items: const [
                                DropdownMenuItem(
                                  value: 'Informatique & Electronique',
                                  child: Text('Informatique & Electronique'),
                                ),
                                DropdownMenuItem(
                                  value: 'Véhicules',
                                  child: Text('Véhicules'),
                                ),
                                DropdownMenuItem(
                                  value: 'Immobilier',
                                  child: Text('Immobilier'),
                                ),
                                DropdownMenuItem(
                                  value: 'Mode et Vêtements',
                                  child: Text('Mode et Vêtements'),
                                ),
                                DropdownMenuItem(
                                  value: 'Sport & Loisirs',
                                  child: Text('Sport & Loisirs'),
                                ),
                                DropdownMenuItem(
                                  value: 'Alimentation',
                                  child: Text('Alimentation'),
                                ),
                                DropdownMenuItem(
                                  value: 'Matériel Pro',
                                  child: Text('Matériel Pro'),
                                ),
                                DropdownMenuItem(
                                  value: 'Electroménagère',
                                  child: Text('Electroménagère'),
                                ),
                                DropdownMenuItem(
                                  value: 'Pour la maison',
                                  child: Text('Pour la maison'),
                                ),
                                DropdownMenuItem(
                                  value: 'Fournitures de Bureaux',
                                  child: Text('Fournitures de Bureaux'),
                                ),
                                DropdownMenuItem(
                                  value: 'Services',
                                  child: Text('Services'),
                                ),
                              ],
                              onChanged: (String? newValeur) {
                                setState(() {
                                  dropdowncategorie = newValeur!;
                                });
                              },
                            ),
                          ),
                        ),

                        //
                        // sous categorie

                        dropdowncategorie == 'Informatique & Electronique'
                            ? Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 6, top: 15),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      label: const Text(
                                        'Selectionnez une sous catégories',
                                        style: TextStyle(fontSize: 12),
                                      ),
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
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    isExpanded: true,
                                    itemHeight: 60,
                                    hint: Text(
                                      'Toutes les sous catégories',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                    items: const [
                                      //
                                      // véhicule

                                      DropdownMenuItem(
                                        value: 'Ordinateur',
                                        child: Text('Ordinateur'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Téléphones & Tablettes',
                                        child: Text('Téléphones & Tablettes'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Accessoires Informatique',
                                        child: Text('Accessoires Informatique'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Accessoires Téléphoniques',
                                        child:
                                            Text('Accessoires Téléphoniques'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Jeux vidéo & Console',
                                        child: Text('Jeux vidéo & Console'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Appareils photos & Caméras',
                                        child:
                                            Text('Appareils photos & Caméras'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'TV,box & Vidéo projection',
                                        child:
                                            Text('TV,box & Vidéo projection'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Imprimantes & Photocopieuses',
                                        child: Text(
                                            'Imprimantes & Photocopieuses'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Autre électronique',
                                        child: Text('Autre électronique'),
                                      ),
                                    ],
                                    onChanged: (String? newValeur) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            : Container(),

                        //
                        // Véhicules
                        dropdowncategorie == 'Véhicules'
                            ? Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 6, top: 15),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      label: const Text(
                                        'Selectionnez une sous catégories',
                                        style: TextStyle(fontSize: 12),
                                      ),
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
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    isExpanded: true,
                                    itemHeight: 60,
                                    items: const [
                                      //
                                      // véhicule

                                      DropdownMenuItem(
                                        value: 'Voitures',
                                        child: Text('Voitures'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Motos & Vélos',
                                        child: Text('Motos & Vélos'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Location de véhicules',
                                        child: Text('Location de véhicules'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Covoiturage',
                                        child: Text('Covoiturage'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Pièces détachées',
                                        child: Text('Pièces détachées'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Bateaux',
                                        child: Text('Bateaux'),
                                      ),
                                    ],
                                    onChanged: (String? newValeur) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                        //
                        // Immobilier
                        dropdowncategorie == 'Immobilier'
                            ? Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 6, top: 15),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      label: const Text(
                                        'Selectionnez une sous catégories',
                                        style: TextStyle(fontSize: 12),
                                      ),
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
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    isExpanded: true,
                                    itemHeight: 60,
                                    items: const [
                                      //
                                      // immobilier
                                      DropdownMenuItem(
                                        value: 'Maison à louer',
                                        child: Text('Maison à louer'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Maison à vendre',
                                        child: Text('Maison à vendre'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Covoiturage',
                                        child: Text('Covoiturage'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Appartements meublés',
                                        child: Text('Appartementsn meublés'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Bureau et locaux commerciaux',
                                        child: Text(
                                            'Bureau et locaux commerciaux'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Terrains et parcelles',
                                        child: Text('Terrains et parcelles'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Bon séjour',
                                        child: Text('Bon séjour'),
                                      ),
                                    ],
                                    onChanged: (String? newValeur) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            : Container(),

                        //
                        // Mode et Vêtements
                        dropdowncategorie == 'Mode et Vêtements'
                            ? Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 6, top: 15),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      label: const Text(
                                        'Selectionnez une sous catégories',
                                        style: TextStyle(fontSize: 12),
                                      ),
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
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    isExpanded: true,
                                    itemHeight: 60,
                                    items: const [
                                      //
                                      // mode et vetement
                                      DropdownMenuItem(
                                        value: 'Spéciales homme',
                                        child: Text('Spéciales homme'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Spéciales femme',
                                        child: Text('Spéciales femme'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Spéciales enfant',
                                        child: Text('Spéciales enfant'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Art & Artisanat',
                                        child: Text('Art & Artisanat'),
                                      ),
                                    ],
                                    onChanged: (String? newValeur) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                        //
                        //Sport & Loisirs
                        dropdowncategorie == 'Sport & Loisirs'
                            ? Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 6, top: 15),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      label: const Text(
                                        'Selectionnez une sous catégories',
                                        style: TextStyle(fontSize: 12),
                                      ),
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
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    isExpanded: true,
                                    itemHeight: 60,
                                    items: const [
                                      //
                                      // sport et loisir
                                      DropdownMenuItem(
                                        value:
                                            'Top accessoires sportifs & Fitness',
                                        child: Text(
                                            'Top accessoires sportifs & Fitness'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Instrument de musique',
                                        child: Text('Instrument de musique'),
                                      ),
                                    ],
                                    onChanged: (String? newValeur) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            : Container(),

                        //
                        // Alimentation
                        dropdowncategorie == 'Alimentation'
                            ? Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 6, top: 15),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      label: const Text(
                                        'Selectionnez une sous catégories',
                                        style: TextStyle(fontSize: 12),
                                      ),
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
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    isExpanded: true,
                                    itemHeight: 60,
                                    items: const [
                                      //
                                      // alimentation
                                      DropdownMenuItem(
                                        value: 'En gros',
                                        child: Text('En gros'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Semi gros',
                                        child: Text('Semi gros'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'En détails',
                                        child: Text('En détails'),
                                      ),
                                    ],
                                    onChanged: (String? newValeur) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            : Container(),

                        //
                        // Matériel Pro
                        dropdowncategorie == 'Matériel Pro'
                            ? Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 6, top: 15),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      label: const Text(
                                        'Selectionnez une sous catégories',
                                        style: TextStyle(fontSize: 12),
                                      ),
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
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    isExpanded: true,
                                    itemHeight: 60,
                                    items: const [
                                      //
                                      // materiel pro
                                      DropdownMenuItem(
                                        value: 'Matériel agricole',
                                        child: Text('Matériel agricole'),
                                      ),
                                      DropdownMenuItem(
                                        value:
                                            'Materiaux construction, BTP, Outillages',
                                        child: Text(
                                            'Materiaux construction, BTP, Outillages'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Fournitures de Bureaux',
                                        child: Text('Fournitures de Bureaux'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Matériel marchés & Commerces',
                                        child: Text(
                                            'Matériel marchés & Commerces'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Matériel Médical',
                                        child: Text('Matériel Médical'),
                                      ),
                                      DropdownMenuItem(
                                        value:
                                            'Energie, Groupes électrogène & panneaux solaires',
                                        child: Text(
                                            'Energie, Groupes électrogène & panneaux solaires'),
                                      ),
                                      DropdownMenuItem(
                                        value:
                                            'Caméras et matéreils de surveillance',
                                        child: Text(
                                            'Caméras et matéreils de surveillance'),
                                      ),
                                    ],
                                    onChanged: (String? newValeur) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),

                    //
                    //etat du produit et quantité
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
                              hint: Text(
                                etatproduit != ''
                                    ? etatproduit
                                    : 'Etat du produit',
                                style: const TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                  value: 'Neuf',
                                  child: Text(
                                    'Neuf',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Casi Neuf',
                                  child: Text(
                                    'Casi Neuf',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Reconditionné',
                                  child: Text(
                                    'Reconditionné',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Seconde utilisation',
                                  child: Text(
                                    'Seconde utilisation',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                              onChanged: (String? newValeur) {
                                setState(() {
                                  dropdowncategorie = newValeur!;
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
                            ),
                          ),
                        ),
                      ],
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AjoutSecondProduitGrosRecruScreen(
                                    description: _descriptionController.text,
                                    nom: _nomController.text,
                                    localisationproduit:
                                        _localisationController.text,
                                    etatproduit: etatproduit,
                                    quantite: _quantiteController.text,
                                    categorie: dropdowncategorie,
                                  ),
                                ),
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Suivant",
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
            ],
          ),
        ),
      ),
    );
  }
}
