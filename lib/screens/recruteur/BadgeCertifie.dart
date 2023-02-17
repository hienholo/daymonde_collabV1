import 'package:daymonde_collaboration/components/DefaultButton.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

class BadgeCertifie extends StatefulWidget {
  const BadgeCertifie({Key? key}) : super(key: key);

  @override
  State<BadgeCertifie> createState() => _BadgeCertifieState();
}

class _BadgeCertifieState extends State<BadgeCertifie> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
        iconTheme: const IconThemeData(color:bludeBold,size: 30),
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Image.asset('assets/images/badge-CERTIFIER 1.png',width: 40,),
            const Text("Obtenir un badge certifier",style: TextStyle(color: blue),),

          ],
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                children:  const [
                  Text("Obtenez votre pack daymond pro pour confirmer \nvotre badge certifié.\n\nContenu du pack daymond pro :  \n",
                  textAlign: TextAlign.left,
                  style:  TextStyle(fontSize: 18),
                  ),
                   Text("1 Tee-shirt\n1 Polo\n1 Badge pro\n2 Casquette\n1 Code de validation pour un badge certifié",
                  textAlign: TextAlign.left,
                  style:  TextStyle(fontSize: 18,color: blue,fontWeight: FontWeight.bold),
                  ),
                   
                ],
              ),
               Center(
                 child: Padding(
                        padding: const EdgeInsets.only(top:30.0,bottom: 15),
                        child: Stack(
                          children: [
                             Container(
                          decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: blue,
                          image: const DecorationImage(image: AssetImage("assets/images/kit-certifie.png",),fit: BoxFit.cover)
                        
                          ),
                          height: size.height*0.3,
                          width: size.width*0.7,
                          
                                          ),
                          Positioned(
                            left: size.width*0.6,
                            child:Image.asset('assets/images/badge-CERTIFIER 1.png',width: 40,),
)
                          ],
                        ),
                      ),
               ),
               const Text("Obtenez rapidement votre badge certifié sur",
                  textAlign: TextAlign.center,
                  style:  TextStyle(fontSize: 18),),
                  const Text("daymond distribution",
                  textAlign: TextAlign.center,
                  style:  TextStyle(fontSize: 18,color: blue,fontWeight: FontWeight.bold),),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(top:10.0,bottom: 20),
                    child: Text("Mots clé pour trouver le Pack daymond prod plus facilement dans la barre de recherche: Pack daymond prod",
                    textAlign: TextAlign.left,
                    style:  TextStyle(fontSize: 15),),
                  ),
                  DefaultButton(text: "valider le badge",press: (){
                    Navigator.pushNamed(context, "ScanPage");
                  },),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){}, child: const Text("plus d'information")),
                      TextButton(onPressed: (){}, child: const Text("conditions d'utilisation")),
                    ],
                  )
            ],
          ),
        ),
      ),
    );
    
  }
}
