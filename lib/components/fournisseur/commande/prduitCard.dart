import 'package:flutter/material.dart';

class ProduitCard extends StatefulWidget {
   ProduitCard({Key? key,required this.image,required this.title,required this.prix,required this.statut,required this.statutSize}) : super(key: key);
  String image;
  String title;
  final statut;
  String prix;
  double    statutSize;
  @override
  State<ProduitCard> createState() => _ProduitCardState();
}

class _ProduitCardState extends State<ProduitCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          children:[ 
            Column(
            children: [
              Image(image: NetworkImage(widget.image,),width: 100,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 80,
                  child: Text(widget.title,maxLines: 2,style: const TextStyle(overflow: TextOverflow.visible),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15.0,bottom: 10),
                child: Text(widget.prix,),
              )
        
        
            ],
          ),
            Positioned(
              bottom: 1,
              right: 1,
              child: Row(
              children: [
                Visibility(child: widget.statut)
              ],
            ))
             ] 
             ),
      ),
    );
  }
}