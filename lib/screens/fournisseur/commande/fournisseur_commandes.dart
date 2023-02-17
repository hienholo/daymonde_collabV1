import 'package:daymonde_collaboration/components/fournisseur/commande/BottomNavBar.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/fournisseur/commande/Commande_annulee_fournisseur.dart';
import 'package:daymonde_collaboration/screens/fournisseur/commande/Commande_terminee_fournisseur.dart';
import 'package:daymonde_collaboration/screens/fournisseur/commande/pret_pour_livraison.dart';
import 'package:flutter/material.dart';
import 'Com_En_Prepa.dart';
import 'NouvelCom.dart';

class FournisseurCommande extends StatefulWidget {
  const FournisseurCommande({Key? key}) : super(key: key);

  @override
  State<FournisseurCommande> createState() => _FournisseurCommandeState();
}

class _FournisseurCommandeState extends State<FournisseurCommande> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Prête pour livraison",
            style: TextStyle(
                color: blue, fontSize: size.width < 350 ? 11 : 18)),
       ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const NouvelComFournisseur()));
              },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: bludeBold, borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "nouvelle commande",
                              style: TextStyle(
                                  color: orange,
                                  fontSize: size.width < 350 ? 15 : 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Il y a 6 secondes",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            )
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: orange,
                          child: Text(
                            "3",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width < 350 ? 17 : 25,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const ComPretLivraisonFournisseur()));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: bludeBold, borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "près pour livraison",
                              style: TextStyle(
                                  color: blue,
                                  fontSize: size.width < 350 ? 15 : 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "07:42",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            )
                          ],
                        ),
                        CircleAvatar(   
                          backgroundColor: blue,
                         child: Text(
                            "3",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width < 350 ? 17 : 25,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const ComEnPrepaFournisseur()));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: bludeBold, borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "en préparation",
                              style: TextStyle(
                                  color: bludeBold,
                                  fontSize: size.width < 350 ? 15 : 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Il y a 6 secondes",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            )
                          ],
                        ),
                        CircleAvatar( 
                          backgroundColor: bludeBold,
                         child: Text(
                            "3",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width < 350 ? 17 : 25,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Commande_terminee_fournisseur()));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: bludeBold, borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Commandes Terminer",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: size.width < 350 ? 15 : 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Il y a 6 secondes",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            )
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(
                            "3",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width < 350 ? 17 : 25,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>Commande_annulee_fournisseur()));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: bludeBold, borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Commandes Annulées",style: TextStyle(
                                  color: Colors.red,
                                  fontSize: size.width < 350 ? 13 : 17),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Il y a 6 secondes",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            )
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: size.width < 350 ? 13 : 25,
                          child: Text(
                            "3",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width < 350 ? 17 : 25,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ), ],
          ),
        ),
      ),
          bottomNavigationBar: BottomNavbarFournisseur(selectedIndex: 2,),
    );
  }
}
