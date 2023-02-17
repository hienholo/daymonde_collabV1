// ignore_for_file: file_names, must_be_immutable
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/fournisseur/add_produits/Add_produit_enGros1_Screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/add_produits/Add_produit_unitaire_Screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/commande/fournisseur_commandes.dart';
import 'package:daymonde_collaboration/screens/fournisseur/homeFournisseur.dart';
import 'package:daymonde_collaboration/screens/portefeuilles/portefeuille_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BottomNavbarFournisseur extends StatefulWidget {
   BottomNavbarFournisseur({Key? key, required this.selectedIndex}) : super(key: key);
  int selectedIndex ;

  @override
  State<BottomNavbarFournisseur> createState() => _BottomNavbarFournisseurState();
}
enum menuitem {
  item1,
  item2,
}
class _BottomNavbarFournisseurState extends State<BottomNavbarFournisseur> {
  menuitem? _mitem = menuitem.item1;

  int TabBarIndexValue = 0;
  int selectedIndex = 0;
  int CompteIdex = 0;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return
     BottomNavigationBar(
      currentIndex:widget.selectedIndex ,
      onTap: (value) {
        setState(() {
    widget.selectedIndex = value;
    if(value==0){
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>HomeFournisseur()));
    }
    if(value==1){
      showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 300,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/recrutment.png",
                                    width: size.width < 350 ? 25 : 50,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    height: 2,
                                    thickness: 2,
                                    endIndent: 130,
                                    indent: 130,
                                  ),
                                  const SizedBox(height: 5),
                                  const Text('Choisir le type de vente'),
                                  const SizedBox(height: 15),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: ()=> Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>AjoutprodruitRecruUnitaireScreen())),
                                        child: Card(
                                          elevation: 5,
                                          child: ListTile(
                                            title: const SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child:
                                                    Text('Vente unitaire ')),
                                            leading: Radio<menuitem>(
                                              value: menuitem.item1,
                                              activeColor: Colors.orange,
                                              groupValue: _mitem,
                                              onChanged: (menuitem? value) {
                                                setState(() {
                                                  _mitem = value;
                                                  CompteIdex = 0;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                            trailing: const Icon(Icons.navigate_next_outlined) ,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: ()=> Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>AjoutprodruitenRecuGrosScreen())),
                                        child: Card(
                                          elevation: 5,
                                          child: ListTile(
                                            title: const Text(
                                              'Vent en gros',
                                              style: TextStyle(),
                                            ),
                                            leading: Radio<menuitem>(
                                              activeColor: Colors.orange,
                                              value: menuitem.item2,
                                              groupValue: _mitem,
                                              onChanged: (menuitem? value) {
                                                setState(() {
                                                  _mitem = value;
                                                  CompteIdex = 1;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                            trailing: const Icon(Icons.navigate_next_outlined) ,
                                          ),
                                        ),
                                      ),
                                    
                                    ],
                                  )
                                 ] ,
                              ),
                            ),
                          );
                        },
                      );
                    
    }

   /* if(value==2){
      Navigator.push(context, 
          MaterialPageRoute(builder: (context)=>const FournisseurCommande()));
    }
    if(value==3){
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>PortefeuilleFournisseurScreen()));
    } */
    
  });
      },
  selectedLabelStyle: const TextStyle(color: blue),
  unselectedLabelStyle: const TextStyle(color: Colors.black87) ,
  unselectedIconTheme: const IconThemeData(
    color: black ,
  ),
  unselectedItemColor: black,
  selectedIconTheme: const IconThemeData( color: blue),
  items:const [
     BottomNavigationBarItem(
      label: ('Accueil'),
      icon: FaIcon(FontAwesomeIcons.house),
    ),
    BottomNavigationBarItem(
      label: ('Ajouter'),
        icon: FaIcon(FontAwesomeIcons.plus),
    ),
    /* BottomNavigationBarItem(
      label: ('Commande'),
      icon:ImageIcon(AssetImage("assets/images/command-fill.png"),),
      
    ),
    BottomNavigationBarItem(
      label: ('Portefeuille'),
      icon: ImageIcon(AssetImage("assets/images/portefeuille_noir.png"),),
      
    ), */
   
  ]
    );

  }    
}