import 'package:daymonde_collaboration/components/fournisseur/commande/CommandeCard.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/userData.dart';
import 'package:daymonde_collaboration/screens/fournisseur/commande/DetailComPrepa.dart';
import 'package:flutter/material.dart';

import 'Nouvel_ComDetail.dart';

class ComEnPrepaFournisseur extends StatefulWidget {
 const ComEnPrepaFournisseur({Key? key}) : super(key: key);

  @override
  State<ComEnPrepaFournisseur> createState() => _ComEnPrepaFournisseurState();
}

class _ComEnPrepaFournisseurState extends State<ComEnPrepaFournisseur> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("En preparation",
            style: TextStyle(
                color: bludeBold, fontSize: size.width < 350 ? 11 : 18)),
                actions: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded))
                ],
       ),
      body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 20.0, bottom: .0),
                    child: GestureDetector(
                      child: SizedBox(
                        height: size.height,
                        child: ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, i) {
                              return  ComCardFournisseur(
                                image: 'assets/images/prod1.jpg', 
                                prix: '8 000', 
                                temps: "il y'a 4 min",
                                titre: "Complet tunique homme Complet tunique hommetaille ssizesizesizesizesizesizesizesizesizesizesizesizesizesizetandard taille standard  ", 
                                date: '08 Jan. 2020  10:10 ',
                                color: primary,
                                ); }),
                      ),
                              onTap:() {Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>const DetailComPrepaFournisseur()));}
                    ),
                  ),
                ),
    );
             
  }
}