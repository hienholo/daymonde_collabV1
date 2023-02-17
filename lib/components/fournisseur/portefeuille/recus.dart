import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/portefeuilles/NouvellCommandeScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/produit_vendeur_screen.dart';
import 'package:flutter/material.dart';


class FournisseurRecuWidget extends StatefulWidget {
  const FournisseurRecuWidget({super.key});

  @override
  State<FournisseurRecuWidget> createState() => _FournisseurRecuWidgetState();
}

class _FournisseurRecuWidgetState extends State<FournisseurRecuWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.zero,
        color: Colors.grey.shade100,
        child: Builder(
          builder: (context) {
            return ListView(
              children: [
                SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> ProduitVendeurScreen()));
                        },
                        child: kCardRecus(
                          context,
                          'Commision',
                          'https://www.sneakers-actus.fr/wp-content/uploads/2022/03/Nike-Air-Max-1-OG-Red-2022-600x452.jpg',
                          '18 000',
                          '12 Mai 2022',
                          '1 Marché = 1000 Fcfa',
                        ),
                      ),
                      kCardRecus(
                        context,
                        'Commision',
                        'https://www.globalelectronique.com/1774-large_default/accueilsamsung-smart-tv-43-pouces-t5300-noir-garantie-12-mois.jpg',
                        '78 000',
                        '12 Mars 2022',
                        '1 Marché = 1000 Fcfa',
                      ),
                      kCardRecus(
                        context,
                        'Commision',
                        'https://www.ivoiremobiles.net/21186-thickbox_default/samsung-galaxy-s21-ultra-128-go.jpg',
                        '400 000',
                        '12 Jan 2022',
                        '1 Marché = 1000 Fcfa',
                      ),
                      kCardRecus(
                        context,
                        'Commision',
                        'https://www.sneakers-actus.fr/wp-content/uploads/2022/03/Nike-Air-Max-1-OG-Red-2022-600x452.jpg',
                        '18 000',
                        '12 Mai 2022',
                        '1 Marché = 1000 Fcfa',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60,),
              ],
            );
          }
        ),
      ),

      
    );
  }
}

Container kCardRecus(BuildContext context, String nom, String image, String prix, String minute, String commission) {
  return Container(
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 16,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: Image.network(
                                image,
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 1,
                                        bottom: 12,
                                      ),
                                      child: Text('${nom}',style: TextStyle(fontSize: 18),),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text('Reçu le${minute}',style: TextStyle(color: Colors.black,fontSize: 12),),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Text('${commission} ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: blue)),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
        Container(
          height: 7,
        ),

      ],
    ),

  );

}





