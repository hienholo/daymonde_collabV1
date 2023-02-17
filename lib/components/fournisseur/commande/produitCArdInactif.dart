import 'package:flutter/material.dart';

class ProduitCardInactif extends StatefulWidget {
   ProduitCardInactif({Key? key,required this.image,required this.title,required this.prix,required this.BackColor,required this.etat,required this.textColor}) : super(key: key);
  String image;
  String title;
  String prix;
  Color BackColor;
  Color textColor;
  String etat;
  @override
  State<ProduitCardInactif> createState() => _ProduitCardInactifState();
}

class _ProduitCardInactifState extends State<ProduitCardInactif> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(.0),
        child: Stack(
          children:[ 
            Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:5.0),
                child: Image(image: AssetImage(widget.image,),width: 100,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 90,
                  child: Text(widget.title,maxLines: 2,style: const TextStyle(overflow: TextOverflow.visible),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15.0,bottom: 10),
                child: Text(widget.prix,),
              ),
        
            ],
          ),
            
            Positioned(
              right: 1,
              bottom: 0,
              left: 0,
              top: 00,
              child: Container(
                  
                  color: widget.BackColor,
                  child:  Center(
                    child: Text(widget.etat,style: TextStyle(color: widget.textColor),)
                  ),
                ),
            ),
             ] 
             ),
      ),
    );
  }
}