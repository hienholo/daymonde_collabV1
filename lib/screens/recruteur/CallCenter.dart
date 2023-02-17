// ignore_for_file: file_names
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CentreAssistant extends StatefulWidget {
  const CentreAssistant({Key? key}) : super(key: key);

  @override
  State<CentreAssistant> createState() => _CentreAssistantState();
}

class _CentreAssistantState extends State<CentreAssistant> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: primary),
          titleTextStyle: const TextStyle(color: black,fontSize: 25),
          title: const Text("Centre d'assistance",style:TextStyle(color: primary),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: blue,
                  image: const DecorationImage(image: AssetImage("assets/images/prod1.jpg",),fit: BoxFit.cover)

                  ),
                  height: 150,
                  width: double.infinity,
                  
                ),
                const Padding(
                  padding: EdgeInsets.only(top:20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text("Bienvenu au service d’assistant daymond collaboration sélectionnez le moyen le plus facile pour vous de nous contactez cas nous vous attendons pour répondre a vos préoccupation .",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,color: black),
                    ),
                    
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left:size.width*0.35,right:size.width*0.35, top: 10),
                  child: const Divider(color: Colors.grey,thickness: 3,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: GestureDetector(
                    child: const ListTile(
                      title: Text("Message daymond",style: TextStyle(fontSize: 20,color: black),),
                      leading: Icon(Icons.sms,color: black,),
                  
                    ),
                  ),
                ),
                GestureDetector(
                  child: const ListTile(
                    title: Text("WhatsApp direct",style: TextStyle(fontSize: 20,color: black),),
                    leading: Icon(Icons.whatsapp_rounded,color: black,),
                
                  ),
                ),
                GestureDetector(
                  child: const ListTile(
                    title: Text("Appel téléphonique",style: TextStyle(fontSize: 20,color: black),),
                    leading: Icon(Icons.phone,color: black,),
                
                  ),
                ),
                GestureDetector(
                  child: const ListTile(
                    title: Text("E-mail",style: TextStyle(fontSize: 20,color: black),),
                    leading: Icon(Icons.attach_email,color: black,),
                
                  ),
                ),
              Padding(
                padding:  EdgeInsets.only(left:size.width*0.24,right:size.width*0.24,top: 20 ),
                child: Row(
                  children: [
                    IconButton(onPressed: (){}, icon:const Icon(Icons.facebook_sharp)),
                    IconButton(onPressed: (){}, icon:const FaIcon(FontAwesomeIcons.instagram),),
                  ],
                ),
              ),
             RichText(textAlign: TextAlign.center,text: const TextSpan(children: [
              TextSpan(text: 'Consultez ',style: TextStyle(color: black)),
              TextSpan(text: "Centre d'aide ",style: TextStyle(color: blue), ),
              TextSpan(text: 'pour tous savoir \n Sur daymond distribution',style: TextStyle(color: black),)
             ]))
              ],
            ),
          )
          ),
    );
    
  }
}

