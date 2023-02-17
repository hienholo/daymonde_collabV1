import 'package:flutter/material.dart';

import '../../components/MoreInfo/video_items.dart';
import '../../const/color.dart';
class ConditionUsing extends StatefulWidget {
  const ConditionUsing({Key? key}) : super(key: key);

  @override
  State<ConditionUsing> createState() => _ConditionUsingState();
}

class _ConditionUsingState extends State<ConditionUsing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: black,
        title: const Text("Condition d'utilisation"),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
      ),
     
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
                       
    );
    
  }
}