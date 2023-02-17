import 'package:daymonde_collaboration/components/fournisseur/Nume_whatsapp2_Screen.dart';
import 'package:flutter/material.dart';


class AjoutSecondProduitGrosRecruScreen extends StatefulWidget {
  const AjoutSecondProduitGrosRecruScreen(
      {super.key,
      required this.description,
      required this.nom,
      required this.localisationproduit,
      required this.etatproduit,
      required this.quantite,
      required this.categorie});
  final String description;
  final String nom;
  final String localisationproduit;
  final String etatproduit;
  final String quantite;
  final String categorie;
  @override
  State<AjoutSecondProduitGrosRecruScreen> createState() =>
      _AjoutSecondProduitGrosScreenState();
}

class _AjoutSecondProduitGrosScreenState
    extends State<AjoutSecondProduitGrosRecruScreen> {
  final TextEditingController _prixofficielController = TextEditingController();
  final TextEditingController _prixgrossisteController =
      TextEditingController();
  final TextEditingController _nombrepieceController = TextEditingController();
  final TextEditingController _NumWhatssappController = TextEditingController();
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
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Column(
            children: <Widget>[
              //Prix officiel
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _prixofficielController,
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Prix de vente général",
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

              //Prix Grossiste
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _prixgrossisteController,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Prix grossiste",
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

              //nombres de pièces
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _nombrepieceController,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "A partir de combien de pièces ?",
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

              //contact whatsApp
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.only(top: 5),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: InputPhoneNumber2Screen(
                    Label: '07 59 02 85 45',
                    PhoneNumberController: _NumWhatssappController,
                  ),
                ),
              ),

              const SizedBox(
                height: 100,
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
                      onPressed: () {},
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
    );
  }
}
