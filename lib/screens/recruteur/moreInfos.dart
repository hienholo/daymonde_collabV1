// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';

import '../../components/MoreInfo/video_items.dart';
import '../../const/color.dart';


class MoreInfos extends StatefulWidget {
  const MoreInfos({Key? key,}) : super(key: key);

  @override
  _MoreInfosState createState() => _MoreInfosState();
}

class _MoreInfosState extends State<MoreInfos> {  
 bool _expanded0 =false; 
bool _expanded1 = false;
bool _expanded2  =false;
bool _expanded3 = false;

List<bool> listExpande = [false,false]; 

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: black,
        title: const Text("Plus d'informations"),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
      ),
     
      body: SingleChildScrollView(
        child: Column(
            children: [
              Center(
                child: Container(
                  color: Colors.green,
                  child: ExpansionPanelList(
                    animationDuration: const Duration(milliseconds: 1000),
                    children: [
                      
                      ExpansionPanel(
                        backgroundColor: grey,
                        headerBuilder: (context, isExpanded1) {
                          return Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Text("Daymond collaboration", style: TextStyle(color: Colors.black,fontSize: 20),),
                            ),
                          );
                        },
                        body:SingleChildScrollView(
                          child: Column(
                                children: [
                                   Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                     child: Padding(
                                       padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                       child: Column(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only( bottom:15.0),
                                             child: Text('comment ça marche ?'.toUpperCase(),style: const TextStyle(fontSize: 25),),
                                           ),
                                           const Text("Pour commencer vous expliquer la fonctionnalité de l’offre daymond a vos clients vos proches,vos amis et familles et une fois intéresser, vous passer à l’inscription gratuit qui ne prend que 2 minutes, via votre compte.",style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                                
                                         ],
                                       ),
                                     ),
                                   ),
                                    Padding(
                                       padding: const EdgeInsets.only(top:20.0),
                                       child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                       child: Padding(
                                         padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                         child: Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only( bottom:15.0),
                                               child: Text('comment ça marche ?'.toUpperCase(),style: const TextStyle(fontSize: 25),),
                                             ),
                                             const Text("Vous gagnez 1000 FCFA sur chaque mâché enregistré par vos filleuls \n Et cela est valable sur les 5 premiers mâchés enregistré au nom de vos filleuls à l'aide d'un compte automatique qui répond instantanément une fois un mâché validé .",style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                                
                                           ],
                                         ),
                                       ),
                                   ),
                                     ),
                                    Padding(
                                       padding: const EdgeInsets.only(top:20.0),
                                       child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                       child: Padding(
                                         padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                         child: Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only( bottom:15.0),
                                               child: Text("Lisez la formation pour ...".toUpperCase(),style: const TextStyle(fontSize: 25),),
                                             ),
                                          VideoPlayers(video_url: 'https://www.youtube.com/embed/ora27t7Hy_E',)                          
                                           ],
                                         ),
                                       ),
                                   ),
                                     )
                                
                                ],
                          ),
                        ),
                        isExpanded: _expanded0,
                        canTapOnHeader: true,
                      ),
                   
                      ExpansionPanel(
                        backgroundColor: grey,
                        headerBuilder: (context, isExpanded) {
                          return Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Text("Compte vendeur", style: TextStyle(color: Colors.black,fontSize: 20),),
                            ),
                          );
                        },
                        body:SingleChildScrollView(
                          child: Column(
                                children: [
                                   Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                     child: Padding(
                                       padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                       child: Column(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only( bottom:15.0),
                                             child: Text('comment ça marche ?'.toUpperCase(),style: const TextStyle(fontSize: 25),),
                                           ),
                                           const Text("Pour commencer vous expliquer la fonctionnalité de l’offre daymond a vos clients vos proches,vos amis et familles et une fois intéresser, vous passer à l’inscription gratuit qui ne prend que 2 minutes, via votre compte.",style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                                
                                         ],
                                       ),
                                     ),
                                   ),
                                    Padding(
                                       padding: const EdgeInsets.only(top:20.0),
                                       child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                       child: Padding(
                                         padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                         child: Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only( bottom:15.0),
                                               child: Text('comment ça marche ?'.toUpperCase(),style: const TextStyle(fontSize: 25),),
                                             ),
                                             const Text("Vous gagnez 1000 FCFA sur chaque mâché enregistré par vos filleuls \n \nEt cela est valable sur les 5 premiers mâchés enregistré au nom de vos filleuls à l'aide d'un compte automatique qui répond instantanément une fois un mâché validé .",style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                                
                                           ],
                                         ),
                                       ),
                                   ),
                                     ),
                                    Padding(
                                       padding: const EdgeInsets.only(top:20.0),
                                       child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                       child: Padding(
                                         padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                         child: Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only( bottom:15.0),
                                               child: Text("Lisez la formation pour ...".toUpperCase(),style: const TextStyle(fontSize: 25),),
                                             ),
                                          VideoPlayers(video_url: 'https://www.fluttercampus.com/video.mp4',)                          
                                           ],
                                         ),
                                       ),
                                   ),
                                     )
                                
                                ],
                          ),
                        ),
                        isExpanded: _expanded1,
                        canTapOnHeader: true,
                      ),
                      ExpansionPanel(
                        backgroundColor: grey,
                        headerBuilder: (context, isExpanded1) {
                          return Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Text("Compte fournisseur", style: TextStyle(color: Colors.black,fontSize: 20),),
                            ),
                          );
                        },
                        body:SingleChildScrollView(
                          child: Column(
                                children: [
                                   Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                     child: Padding(
                                       padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                       child: Column(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only( bottom:15.0),
                                             child: Text('comment ça marche ?'.toUpperCase(),style: const TextStyle(fontSize: 25),),
                                           ),
                                           const Text(''' Cette fonctionnalité est composée de 2 catégories ÊTRES PARRAIN FOURNISSEUR et ÊTRES PARRAIN VENDEUR.\nEt vous donne la possibilité de gagner de l’agent un seul compte ''',style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                                
                                         ],
                                       ),
                                     ),
                                   ),
                                    Padding(
                                       padding: const EdgeInsets.only(top:20.0),
                                       child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                       child: Padding(
                                         padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                         child: Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only( bottom:15.0),
                                               child: Text('comment ça marche ?'.toUpperCase(),style: const TextStyle(fontSize: 25),),
                                             ),
                                           const Text(''' Cette fonctionnalité est composée de 2 catégories ÊTRES PARRAIN FOURNISSEUR et ÊTRES PARRAIN VENDEUR.\nEt vous donne la possibilité de gagner de l’agent un seul compte ''',style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                                
                                           ],
                                         ),
                                       ),
                                   ),
                                     ),
                                    Padding(
                                       padding: const EdgeInsets.only(top:20.0),
                                       child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                       child: Padding(
                                         padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                         child: Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only( bottom:15.0),
                                               child: Text("Lisez la formation pour ...".toUpperCase(),style: const TextStyle(fontSize: 25),),
                                             ),
                                          VideoPlayers(video_url: 'https://www.youtube.com/embed/ora27t7Hy_E',)                          
                                           ],
                                         ),
                                       ),
                                   ),
                                     )
                                
                                ],
                          ),
                        ),
                        isExpanded: _expanded2,
                        canTapOnHeader: true,
                      ),
                      
                      ExpansionPanel(
                        backgroundColor: grey,
                        headerBuilder: (context, isExpanded1) {
                          return Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Text("Badge certifié", style: TextStyle(color: Colors.black,fontSize: 20),),
                            ),
                          );
                        },
                        body:SingleChildScrollView(
                          child: Column(
                                children: [
                                   Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                     child: Padding(
                                       padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                       child: Column(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only( bottom:15.0),
                                             child: Text('comment ça marche ?'.toUpperCase(),style: const TextStyle(fontSize: 25),),
                                           ),
                                           const Text("Pour commencer vous expliquer la fonctionnalité de l’offre daymond a vos clients vos proches,vos amis et familles et une fois intéresser, vous passer à l’inscription gratuit qui ne prend que 2 minutes, via votre compte.",style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                                
                                         ],
                                       ),
                                     ),
                                   ),
                                    Padding(
                                       padding: const EdgeInsets.only(top:20.0),
                                       child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                       child: Padding(
                                         padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                         child: Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only( bottom:15.0),
                                               child: Text('comment ça marche ?'.toUpperCase(),style: const TextStyle(fontSize: 25),),
                                             ),
                                             const Text("Vous gagnez 1000 FCFA sur chaque mâché enregistré par vos filleuls \n Et cela est valable sur les 5 premiers mâchés enregistré au nom de vos filleuls à l'aide d'un compte automatique qui répond instantanément une fois un mâché validé .",style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                                
                                           ],
                                         ),
                                       ),
                                   ),
                                     ),
                                    Padding(
                                       padding: const EdgeInsets.only(top:20.0),
                                       child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                       child: Padding(
                                         padding: const EdgeInsets.only(top:15.0,left: 10,right: 10,bottom: 10),
                                         child: Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only( bottom:15.0),
                                               child: Text("Lisez la formation pour ...".toUpperCase(),style: const TextStyle(fontSize: 25),),
                                             ),
                                          VideoPlayers(video_url: 'https://www.youtube.com/embed/ora27t7Hy_E',)                          
                                           ],
                                         ),
                                       ),
                                   ),
                                     )
                                
                                ],
                          ),
                        ),
                        isExpanded: _expanded3,
                        canTapOnHeader: true,
                      ),
                   
                    ],
                    dividerColor: Colors.grey,
                    expansionCallback: (panelIndex, isExpanded) {
                      int index ;
                     setState(() {
                       index =panelIndex;
                     });
                     print("index==$panelIndex");
                      
                      if(panelIndex==0){
                        _expanded1=false;
                        _expanded2=false;
                        _expanded3= false;
                        _expanded0=!_expanded0;

                      }
                      if(panelIndex==1){
                        _expanded0=false;
                        _expanded2=false;
                        _expanded3=false;
                        _expanded1=!_expanded1;

                      }
                      if(panelIndex==2){
                        _expanded0=false;
                        _expanded1=false;
                        _expanded3=false;
                        _expanded2=!_expanded2;
                      }
                         if(panelIndex==3){
                        _expanded0=false;
                        _expanded1=false;
                        _expanded2=false;
                        _expanded3=!_expanded3;
                      }
                    },
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}