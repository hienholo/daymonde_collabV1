import 'package:flutter/material.dart';
import '../components/home/card.dart';
import '../functions.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool login =false;
    void _loadUserInfo() async {
    bool token = await get_Session();
    print(token);
    // ignore: unnecessary_null_comparison
    if(token ==true){
      setState(() {
        login=true;
      });
    }
    else{
         setState(() {
        login=false;
      });

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserInfo();
  }
  String etape = "pas_de_compte";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
    Scaffold(
      //backgroundColor: primary,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/selecte_compte.jpeg'),
                  fit: BoxFit.cover
              )
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 15.0,
                top: size.width < 350 ? 8 : 15,
                right: 15,
                bottom: 1),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width < 350 ? 15 : 30,
                      left: size.width < 350 ? 15 : 30,
                      right: size.width < 350 ? 15 : 30,
                      bottom: size.width < 350 ? 15 : 30),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logindaymond.png',
                        width: size.width < 350 ? 100 : 100,
                        height: size.width < 350 ? 100 : 100,
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        'Bienvenue sur daymond collaboration,\n veuillez selectionner votre votre secteur',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: size.width < 350 ? 12 : 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // Ajout des différents cards
                GestureDetector(
                  onTap: (() {
                    Navigator.pushNamed(context, 'LoginScreen',
                        arguments: {'screenTitle': 'recruteur'});
                  }),
                  child: HomeCard(
                    title: 'Être recruteur',
                    description:
                    'Devenez recruteur chez daymond et gagner de largent que chaque agent recruté ...',
                    imageUrl: 'assets/images/recrutment.png',
                  ),
                ),

                GestureDetector(
                  onTap: (() {
                    Navigator.pushNamed(context, 'LoginFournisseurScreen',
                        arguments: {'screenTitle': 'fournisseur'});
                  }),
                  child: HomeCard(
                    title: 'Être fournisseur',
                    description:
                    'Comme tous commerçant vous avez toujours besoin de client. Et nous avons toujours des clients potentiels...',
                    imageUrl: 'assets/images/fournisseur.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

