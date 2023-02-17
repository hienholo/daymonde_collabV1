import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

class ComCardFournisseur extends StatefulWidget {
 ComCardFournisseur({Key? key,required this.image,required this.color,required this.date ,required this.titre,required this.prix,required this.temps}) : super(key: key);
  String image;
  String titre;
  String temps;
  String prix;
  String date;
  Color color;
  @override
  State<ComCardFournisseur> createState() => _ComCardFournisseurState();
}

class _ComCardFournisseurState extends State<ComCardFournisseur> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Stack(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Column(
              children:[
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                           image: DecorationImage(
                            image: AssetImage(widget.image),
                            fit: BoxFit.cover,
                          ),
                         
                        ),
                        
    
                    ),
                    SizedBox(
                      width: size.width*0.5,
                      child: Column( mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(widget.titre,maxLines: 2, style: const TextStyle(overflow: TextOverflow.ellipsis),), 
                          Padding(
                            padding: const EdgeInsets.only(top:15.0),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [

                                RichText(
                                  textAlign: TextAlign.right,
                                  text: TextSpan(children: [
                                    TextSpan(text: "${widget.prix}FCFA ",style:    TextStyle(color:blue,fontSize: size.width<361?13:15,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                                  ]),
                        ),
                        // const SizedBox(width: 30,),
                        
                              ],
                            ),
                          ),
                        
                        ],
                      ),
                    ),
                      ],
                     
                    ),
                    const Divider(thickness: 3,color: grey,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(widget.date,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                        GestureDetector(
                          child: Card(
                            color:  widget.color,
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text("Voir les détails",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          onTap: (){},
                        )
                      ],
                    )
                  ]
                  
                  ),
            ),
          ),
        Positioned(
           right:5,
           top: 3,
            child: Padding(
              padding: const EdgeInsets.only(top:3.0,bottom: 3,left: 7,right: 4),
              child: Text(widget.temps,style: const TextStyle(color: black),),
            ))
      ],

     );
    
  }
}