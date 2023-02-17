
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

class NouvelComDetailFournisseur extends StatefulWidget {
  const NouvelComDetailFournisseur({Key? key}) : super(key: key);

  @override
  State<NouvelComDetailFournisseur> createState() => _NouvelComDetailFournisseurState();
}

class _NouvelComDetailFournisseurState extends State<NouvelComDetailFournisseur> {
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
      body: SingleChildScrollView(
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
                                   image: const DecorationImage(
                                    image: AssetImage("assets/images/prod1.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                 
                                ),
                                
          
                            ),
                            Column( mainAxisSize: MainAxisSize.max,
                              children: const [
                                Text("Complet tunique homme taille standard ",maxLines: 2, style: TextStyle(overflow: TextOverflow.ellipsis),), 
                                Padding(
                                  padding: EdgeInsets.only(top:15.0),
                                  child:Text("6 500 FCFA ",style:  TextStyle(color:blue,fontSize: 14,fontWeight: FontWeight.bold),),

                              
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
                          const Text("information de la commande"),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                   SizedBox(height: 10,),
                                   Text("Quantité          "),
                                   SizedBox(height: 10,),
                                   Text("Quantité          "),
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
                                   SizedBox(height: 10,),
                                   Text(": "),
                                   SizedBox(height: 10,),
                                   Text(": "),
                                ],
                              ),
                           
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                   SizedBox(height: 10,),
                                   Text("2 pièces"),
                                   SizedBox(height: 10,),
                                   Text("70 000 cfa pièces"),
                                   SizedBox(height: 10,),
                                   Text("demain a 10:10"),
                                   SizedBox(height: 10,),
                                   Text("cote d'ivoire, Yamoussoukro ",style: TextStyle(color: blue),),
                                ],
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
                                decoration: const BoxDecoration(border:Border(bottom: BorderSide(width: 2,color: grey))),
                                child: const Text("Autres détails",textAlign: TextAlign.center,),
                              ),
                          
                              const TextField(
                                maxLines: 5,
                                textAlign:TextAlign.center,
                                decoration: InputDecoration(hintText: "plus de détails",
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
          ],
        ),
      ),
      bottomSheet: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,top: 10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
             Text("Marquer la commande",style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: size.width<360? 12:15),),
            Row(
              
              children:   [
                GestureDetector(
                  child: Card(
                    color: blue,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Prés pour la livraison",style: TextStyle(overflow: TextOverflow.ellipsis,color: light,fontSize:size.width<360? 12:15)),
                      ),
                    ),
                  ),
                  onTap: (){
                    
      showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: size.width*0.8,
                            height: 260,
                            child: Column(
                              children: [
                                Container(
                                  
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        
                                        const SizedBox(height: 15),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [ 
                                            Image.asset("assets/images/dddd.png",color: black,width: 60,),
                                            const SizedBox(height: 20,),
                                            const Text("voulez vous vraiment marqué cette command"),
                                            const Text("En préparation",textAlign: TextAlign.center,style: TextStyle(color: orange),),
                                            const SizedBox(height: 30,),

                                          ],
                                        )
                                       ] ,
                                    ),
                                  ),
                                ),
                               Padding(
                                 padding: const EdgeInsets.only(left:8.0,right: 10),
                                 child: Row(
                                    mainAxisSize: MainAxisSize.max,   
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                                   children:   [
                                     Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: blue
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      width: size.width*0.4,
                                       child: Padding(
                                         padding: const EdgeInsets.all(5.0),
                                         child: Text("Non",textAlign: TextAlign.center, style: TextStyle(overflow: TextOverflow.ellipsis,color: blue,fontSize:size.width<360? 13:15)),
                                       ),
                                     ),
                                   GestureDetector(
                                     onTap: (() {
                                       Navigator.pop(context);   }),
                                     child:  Card(
                                      
                                       color: blue,
                                       child: SizedBox(
                                         width:size.width*0.4,
                                         child: Padding(
                                           padding: const EdgeInsets.all(5.0),
                                           child:Text("Oui",textAlign: TextAlign.center,style: TextStyle(color: light,fontSize:size.width<360? 13:15,fontWeight: FontWeight.bold),)
                                         ),
                                       ),
                                     ),
                                   ),
                                   ],
                                 ),
                               )]
                            ),
                          );
                        },
                      );
       
                
                  },
                ),
               GestureDetector(
                 onTap: (() {
                   
      showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                Container(
                                  
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        
                                        const SizedBox(height: 15),
                                        Column(
                                          children: [ Card(
                                            color: primary,
                                              
                                              child: ListTile(
                                                title:  Text(
                                                  'En préparation',
                                                  style: TextStyle(color: light,fontSize: size.width < 350 ? 15 : 20,fontWeight: FontWeight.bold),
                                                ),
                                                leading:Image.asset("assets/images/dddd.png",
                                              width: size.width < 350 ? 20 : 40,  ),)
                                             ),
                                             const SizedBox(
                                              height: 10,
                                            ),
                                            Card(
                                              color: blue,
                                             
                                              child: ListTile(
                                                title:  Text(
                                                  'Près pour livraison',
                                                  style: TextStyle(color: light,fontSize: size.width < 350 ? 15 : 20,fontWeight: FontWeight.bold),
                                                ),
                                                leading:Image.asset("assets/images/preparation_commande.png",
                                              width: size.width < 350 ? 20 : 40,  ),)
                                             ),
                                             const SizedBox(
                                              height: 10,
                                            ),
                                           GestureDetector(
                                             child: Card(
                                              color: Colors.red,
                                                
                                                child: ListTile(
                                                  title:  Text(
                                                    'annuler',
                                                    style: TextStyle(color: light,fontSize: size.width < 350 ? 15 : 20,fontWeight: FontWeight.bold),
                                                  ),
                                                  leading:Image.asset("assets/images/icone produit annuler.png",
                                                width: size.width < 350 ? 20 : 40,  ),)
                                               ),
                                            onTap: (){
                                              Navigator.pop(context);
                                              showModalBottomSheet<void>(
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.vertical(
                                                    top: Radius.circular(20),
                                                  ),
                                                ),
                                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return SizedBox(
                                                    width: size.width*0.8,
                                                    height: 260,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          
                                                          padding: const EdgeInsets.all(10),
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          child: Center(
                                                            child: Column(
                                                              children: <Widget>[
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [ 
                                                                    const Text("voulez vous vraiment marqué cette command"),
                                                                    const Divider(thickness: 2,),
                                                                    const SizedBox(height: 30,),
                                                                    Container(
                                                                      width: size.width*078,
                                                                      height: 100,
                                                                      decoration: BoxDecoration(
                                                                        border: Border.all(color: grey)
                                                                      ),
                                                                      child:  const Text("En préparation",textAlign: TextAlign.center,maxLines: 20,style: TextStyle(color: black),),
                                                                      ),

                                                                  ],
                                                                )
                                                              ] ,
                                                            ),
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left:8.0,right: 10),
                                                        child: GestureDetector(
                                                          onTap: (() {
                                                            Navigator.pop(context);   }),
                                                          child:  Card(
                                                            
                                                            color: const Color.fromARGB(255, 238, 17, 1),
                                                            child: SizedBox(
                                                              width:size.width*0.9,
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(5.0),
                                                                child:Padding(
                                                                  padding: const EdgeInsets.all(3.0),
                                                                  child: Text("Marquer annulation",textAlign: TextAlign.center,style: TextStyle(color: light,fontSize:size.width<360? 13:15,fontWeight: FontWeight.bold),),
                                                                )
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )]
                                                    ),
                                                  );
                                                },
                                              );

                                            },
                                           ),
                                          ],
                                        )
                                       ] ,
                                    ),
                                  ),
                                ),
                               Padding(
                                 padding: const EdgeInsets.only(left:8.0,right: 10),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children:  [
                                   Text("Marquer la commande",style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: size.width<360? 12:15),),
                                   Row(
                                                   
                                     children:   [
                                       Card(
                                         color: blue,
                                         child: Expanded(
                                           child: Padding(
                                             padding: const EdgeInsets.all(10.0),
                                             child: Text("Prés pour la livraison",style: TextStyle(overflow: TextOverflow.ellipsis,color: light,fontSize:size.width<360? 12:15)),
                                           ),
                                         ),
                                       ),
                                     GestureDetector(
                                       onTap: (() {
                                         Navigator.pop(context);   }),
                                       child: const Card(
                                         color: Colors.grey,
                                         child: Padding(
                                           padding: EdgeInsets.all(5.0),
                                           child: ImageIcon(AssetImage("assets/images/eject-line.png",),color: light,size: 24,),
                                         ),
                                       ),
                                     ),
                                     ],
                                   )
                                 ]),
                               )]
                            ),
                          );
                        },
                      );
       
                 }),
                 child: const Card(
                   color: Colors.grey,
                   child: Padding(
                     padding: EdgeInsets.all(5.0),
                     child: ImageIcon(AssetImage("assets/images/eject-line.png",),color: light,size: 24,),
                   ),
                 ),
               ),
              ],
            )
          ]
          ),
        ),
      ),
      
       );
    
  }
}