import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';
class DetailComCard extends StatefulWidget {
   DetailComCard({Key? key,
    required this.image,
    required this.details,
    required this.prix,
    required this.qty,
    required this.unit_price,
    required this.frais_livraison,
    required this.montant_total,
    required this.date_livraison,
    required this.lieux_livraison,
    required this.autre_details,
    required this.widget_plus,
    required this.text_bottom,
  }) : super(key: key);

  String image;
  String details;
  String prix;
  String qty;
  String unit_price;
  String frais_livraison;
  String montant_total;
  String date_livraison;
  String lieux_livraison;
  String autre_details;
  Widget widget_plus;
  String text_bottom;

  @override
  State<DetailComCard> createState() => _DetailComCardState();
}

class _DetailComCardState extends State<DetailComCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width <360 ? 11 :size.width > 383 && size.width < 390 ? 15 :22;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(

                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                          children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image:  DecorationImage(
                                      image: AssetImage("${widget.image}"),
                                      fit: BoxFit.cover,
                                    ),

                                  ),


                                ),
                                Column(mainAxisSize: MainAxisSize.max,
                                  children:  [
                                    SizedBox(
                                      width: size.width*0.6,
                                        child: Text("${widget.details}",maxLines: 2, style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                    Padding(
                                      padding: EdgeInsets.only(top:15.0),
                                      child:Text("${widget.prix} FCFA ",style:  TextStyle(color:blue,fontSize: 14,fontWeight: FontWeight.bold),),


                                    ),

                                  ],
                                ),
                              ],

                            ),]

                      ),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        const Text("Détails de la commande"),
                        const SizedBox(height: 20,),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(height: 10,),
                                    Text("Quantité"),
                                    SizedBox(height: 10,),
                                    SizedBox(height: 10,),
                                    Text("Prix unitaire "),
                                    SizedBox(height: 10,),
                                    Text("Livraison  "),
                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(height: 10,),
                                    SizedBox(height: 10,),
                                    Text(": "),
                                    SizedBox(height: 10,),
                                    Text(": "),
                                    SizedBox(height: 10,),
                                    Text(": "),
                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    SizedBox(height: 10,),
                                    Text("${widget.qty}"),
                                    SizedBox(height: 10,),
                                    SizedBox(height: 10,),
                                    Text("${widget.unit_price} Fcfa"),
                                    SizedBox(height: 10,),
                                    Text("${widget.frais_livraison} Fcfa",style: TextStyle(color: blue),),
                                  ],
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Divider(thickness: 2),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Montant',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                      Text('${widget.montant_total} Fcfa',
                                        style: TextStyle(fontSize: 15,color: blue) ,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                        const Divider(thickness: 10,color: grey,),

                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  width: size.width,
                                  child: const Text("Détails de la livraison",textAlign: TextAlign.center,),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          SizedBox(height: 10,),
                                          Text("date de livraison "),
                                          SizedBox(height: 10,),
                                          Text("Lieu de livraison  "),
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          SizedBox(height: 10,),
                                          Text(": "),
                                          SizedBox(height: 10,),
                                          Text(": "),
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          SizedBox(height: 10,),
                                          Text("${widget.date_livraison}"),
                                          SizedBox(height: 10,),
                                          Text("${widget.lieux_livraison}",style: TextStyle(color: blue),),
                                        ],
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  width: size.width,
                                  decoration: const BoxDecoration(border:Border(bottom: BorderSide(width: 2,color: grey))),
                                  child: const Text("Autres détails",textAlign: TextAlign.center,),
                                ),

                                 TextField(
                                  maxLines: 5,
                                  textAlign:TextAlign.center,
                                  enabled: false,
                                  decoration: InputDecoration(hintText: "${widget.autre_details}",
                                    focusedBorder: InputBorder.none,

                                  ),
                                )

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ],

              ),
            ),
          ),
          widget.widget_plus
        ],
      ),
    );
  }
}
