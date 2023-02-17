import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/Apercu_produit_screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/Indisponible_produit_screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/Invisible_produit_screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/Modifier_produit_screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/Statcs_produit_screen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/Stock_produit_screen.dart';
import 'package:flutter/material.dart';

class FournisseurBottomNavBar extends StatefulWidget {
  FournisseurBottomNavBar({Key? key,
    required this.selectedIndex,
    required this.ID_PRODUCT,
  }) : super(key: key);
  int selectedIndex ;
  final ID_PRODUCT;
  @override
  State<FournisseurBottomNavBar> createState() =>
      _HomeDetailProduitScreenState();
}

class _HomeDetailProduitScreenState extends State<FournisseurBottomNavBar> {
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 3;
  int stock_epuise = 2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomNavigationBar(
      currentIndex:widget.selectedIndex ,
      onTap: (value) {
        setState(() {
          widget.selectedIndex = value;
          if(value==0){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ApercuProduitScreen(ID_PRODUCT: 1)));
          }
          if(value==1){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ProduitModifierScreen(ID_PRODUCT: widget.ID_PRODUCT)));
          }
          if(value==2){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ProduitStockepuiserScreen(ID_PRODUCT: widget.ID_PRODUCT)));
          }
          if(value==3){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ProduitIndisponibleScreen(ID_PRODUCT: widget.ID_PRODUCT,)));
          }
          if(value==4){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ProduitInvisibleScreen()));
          }
          if(value==5){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>StatistiquProduitScreen(ID_PRODUCT:widget.ID_PRODUCT ,)));
          }

        });
      },
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      iconSize: 24,
      elevation: 5,
      items: [
        //APERCU
        BottomNavigationBarItem(
          icon: SizedBox(
            width: bottomBarWidth,
            child: const Icon(
              Icons.border_outer,
            ),
          ),
          label: 'Aperçu',
        ),
        //MODIFIER
        BottomNavigationBarItem(
          icon: SizedBox(
            width: bottomBarWidth,
            child: const Icon(
              Icons.draw,
            ),
          ),
          label: 'Modifier',
        ),
//STOCK EPUISER
        BottomNavigationBarItem(
          icon: SizedBox(
            width: bottomBarWidth,
            child: InkWell(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/imo.png',
                          width: 80,
                        ),
                      ],
                    ),
                    content: Text(
                      'Voulez vous vraiment marquer\n  ce produit en stock epuisé ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: size.width < 321 ? 10 : 13),
                    ),
                    actions: <Widget>[
                      const Divider(
                        thickness: 2,
                        color: Colors.blue,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.3,
                            child: TextButton(
                              onPressed: () => Navigator.pop(context, 'NON'),
                              child: const Text('NON'),
                            ),
                          ),
                          Container(
                            width: size.width * 0.3,
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  widget.selectedIndex = stock_epuise;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('OUI'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(
                Icons.check_circle_outline,
              ),
            ),
          ),
          label: 'Stock épuisè',
        ),
        //INDISPONIBLE
        BottomNavigationBarItem(
          icon: SizedBox(
            width: bottomBarWidth,
            child: const Icon(
              Icons.do_disturb_alt,
            ),
          ),
          label: 'Indisponible',
        ),
//INVISIBLE
        BottomNavigationBarItem(
          icon: SizedBox(
            width: bottomBarWidth,
            child: const Icon(
              Icons.visibility_off,
            ),
          ),
          label: 'Invisible',
        ),
        //STATISTIQUE
        BottomNavigationBarItem(
          icon: SizedBox(
            width: bottomBarWidth,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    constraints: const BoxConstraints(),
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Positioned(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(
                                          Icons.clear_rounded,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.query_stats_rounded,
                                color: Colors.blue,
                              ),
                              Text(
                                'Statistique',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 4,
                            width: 30,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 20, right: 20),
                            child: ListTile(
                              title: const Text(
                                'Vendu',
                                style: TextStyle(fontSize: 15),
                              ),
                              trailing: const Text('27'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          const Divider(
                            color: Colors.black26,
                            thickness: 2,
                            indent: 15,
                            endIndent: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30.0, left: 20, right: 20),
                            child: ListTile(
                              title: const Text(
                                'En cours',
                                style: TextStyle(fontSize: 15),
                              ),
                              trailing: const Text('04'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Publié le 26 jan., 2022 a 17:36")
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                      // return
                      // Column(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: <Widget>[
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 40, top: 8),
                      //       child: Row(
                      //         mainAxisAlignment:
                      //             MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.only(
                      //                 left: 90, right: 50),
                      //             child: Container(
                      //               height: 3,
                      //               width: 40,
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.only(left: 30),
                      //             child: Stack(
                      //               alignment: Alignment.topRight,
                      //               children: [
                      //                 Positioned(
                      //                   child: InkWell(
                      //                     onTap: () {
                      //                       Navigator.pop(context);
                      //                     },
                      //                     child: const Icon(
                      //                       Icons.clear_rounded,
                      //                       color: Colors.black54,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     InkWell(
                      //       onTap: () {},
                      //       child: Text("Choisir le type de vente"),
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: Card(
                      //         shape: RoundedRectangleBorder(
                      //           side: const BorderSide(
                      //             color: Colors.black12,
                      //           ),
                      //           borderRadius: BorderRadius.circular(8),
                      //         ),
                      //         elevation: 1,
                      //         margin: const EdgeInsets.only(
                      //             top: 20, left: 8, right: 8, bottom: 8),
                      //         child: ListTile(
                      //           leading: const Icon(
                      //             Icons.radio_button_checked,
                      //             color: Colors.orange,
                      //           ),
                      //           title: const Text('Vente unitaire'),
                      //           trailing: const Icon(Icons.chevron_right),
                      //           onTap: () {
                      //             Navigator.pop(context);
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: Card(
                      //         shape: RoundedRectangleBorder(
                      //           side: const BorderSide(
                      //             color: Colors.black12,
                      //           ),
                      //           borderRadius: BorderRadius.circular(8),
                      //         ),
                      //         elevation: 1,
                      //         margin: const EdgeInsets.only(
                      //             top: 6, left: 8, right: 8, bottom: 40),
                      //         child: ListTile(
                      //           leading:
                      //               const Icon(Icons.radio_button_checked),
                      //           title: const Text('Vent en gros'),
                      //           trailing: const Icon(Icons.chevron_right),
                      //           onTap: () {
                      //             Navigator.pop(context);
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // );
                    });
              },
              child: const Icon(
                Icons.query_stats_rounded,
              ),
            ),
          ),
          label: 'Statistique',
        ),
      ],
    );
  }
}
