import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';
class MissionOkeyScreen extends StatefulWidget {
  const MissionOkeyScreen({Key? key}) : super(key: key);

  @override
  State<MissionOkeyScreen> createState() => _MissionOkeyScreenState();
}

class _MissionOkeyScreenState extends State<MissionOkeyScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: black),
        automaticallyImplyLeading: false,
        title:Row(
          children: [
            Image.asset("assets/images/MISSION.png",width: 30,),
            SizedBox(width: 5,),
            RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Nouvelle Mission\n",style: TextStyle(color: black,fontWeight: FontWeight.bold,fontSize: 12)),
                  TextSpan(text: "En cours",style: TextStyle(color: black,fontSize: 10)),
                ]
            ))
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
          IconButton(onPressed: (){}, icon: Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
        ],
      ),
      body: ListView(
          children:[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(

                child:Column(
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/civ.png",width: 50,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40,top: 20),
                        child: SizedBox(
                          width: size.width*07,
                          child: Text(textAlign:TextAlign.center,"""Bonjour monsieur MICHAEL KOUAME DAYMOND\nà besoin d’un fournisseur d'ordinateur bureaux """),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(textAlign:TextAlign.left,"""Image similaire """),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/images/ODINATEUR bleu.png",width: size.width*0.3,),
                                )
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/images/ODINATEUR bleu.png",width: size.width*0.25,),
                                )
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20.0,bottom: 30),
                            child: RichText(textAlign: TextAlign.left, text: TextSpan(
                                children: [
                                  TextSpan(text:"Mission Terminée",style: TextStyle(color: Colors.green)
                                  ),
                                ]
                            )),
                          ),
                        ],
                      ),

                      InkWell(
                        onTap: ()=>null,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Card(
                            color: blue,
                            child: Container(
                                width: size.width*0.7,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(textAlign:TextAlign.center,"OK".toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                )),
                          ),
                        ),
                      )


                    ]
                ) ,

              ),
            ),
          ]
      ),
    );
  }
}
