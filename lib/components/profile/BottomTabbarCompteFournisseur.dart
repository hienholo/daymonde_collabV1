// ignore_for_file: file_names, must_be_immutable

import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/portefeuilles/portefeuille_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilBottomCompteFournisseur extends StatefulWidget {
   ProfilBottomCompteFournisseur({Key? key, required this.selectedIndex}) : super(key: key);
  int selectedIndex ;

  @override
  State<ProfilBottomCompteFournisseur> createState() => _ProfilBottomCompteFournisseurState();
}

class _ProfilBottomCompteFournisseurState extends State<ProfilBottomCompteFournisseur> {
  @override
  Widget build(BuildContext context) {

    return
     BottomNavigationBar(
      currentIndex:widget.selectedIndex ,
      onTap: (value) {
        setState(() {
    widget.selectedIndex = value;
    if(value==0){
      Navigator.pushNamed(context, 'ProfilScrenn',  arguments: {'screenTitle': 'ambassadeur'});
    }
    if(value==1){
      Navigator.pushNamed(context, 'Statistiques');
    }
    if(value==2){
      Navigator.pushNamed(context, 'AddFournisseur');
    }
    if(value==3){
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>PortefeuilleFournisseurScreen()));
    }
     if(value==4){
      Navigator.pushNamed(context, 'SettingsRecruteur');
    }
    
  });
      },
  selectedLabelStyle: const TextStyle(color: blue),
  unselectedLabelStyle: const TextStyle(color: Colors.black87) ,
  unselectedIconTheme: const IconThemeData(
    color: black ,
  ),
  unselectedItemColor: Colors.deepOrangeAccent,
  selectedIconTheme: const IconThemeData( color: blue),
  items:const [
     BottomNavigationBarItem(
      label: ('Accueil'),
      icon: FaIcon(FontAwesomeIcons.house),
    ),
    BottomNavigationBarItem(
      label: ('statistic'),
        icon: Icon(Icons.leaderboard),
    ),
    BottomNavigationBarItem(
      label: ('Ajouter'),
      icon: FaIcon(FontAwesomeIcons.plus),
      
    ),
     BottomNavigationBarItem(
      label: ('Ajouter'),
      icon: FaIcon(FontAwesomeIcons.moneyBillWave),
    ),
     BottomNavigationBarItem(
      label: ('Profil'),
      icon: Icon(Icons.person),
    )
  ]
    );

  }    
}