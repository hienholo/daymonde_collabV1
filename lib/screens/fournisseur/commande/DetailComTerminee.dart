
import 'package:daymonde_collaboration/components/fournisseur/commande/DetailComCard.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

class DetailComTermineeFournisseur extends StatefulWidget {
  const DetailComTermineeFournisseur({Key? key}) : super(key: key);

  @override
  State<DetailComTermineeFournisseur> createState() => _DetailComTermineeFournisseurState();
}

class _DetailComTermineeFournisseurState extends State<DetailComTermineeFournisseur> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double fontsize = size.width <360 ? 11 :size.width > 383 && size.width < 390 ? 15 :22;

    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme:const IconThemeData(color: black),
        title: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children:  [
            const Text(" DETAILS",style: TextStyle(color: black),),
            Row(
              children: [
                const Text("08 Jan. 2020  10:10 ",style: TextStyle(fontSize: 10,color: black),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.delete))

              ],
            )

          ],

        ),

      ),
      body: DetailComCard(
        image: 'assets/images/prod1.jpg',
        prix: '40.000',
        details: "Complet tunique homme Complet tunique hommetaille ssizesizesizesizesizesizesizesizesizesizesi taille standard ",
        qty: 'dxwcx',
        unit_price: 'qsq',
        frais_livraison: "qsqq",
        lieux_livraison: 'qsq',
        montant_total: "qsq",
        autre_details: "qsq",
        date_livraison: '',
        text_bottom: 'sqdsdfs',
        widget_plus: Text('dsds'),
      ),
      bottomSheet: Card(
        color: blue,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,top: 10,bottom: 10),
          child: Container(
            width: size.width*0.8,
              child: Text('Consulter le portefeuille',textAlign: TextAlign.center,style: TextStyle(color: light,fontSize: 15),)
          )
        ),
      ),

    );

  }
}


