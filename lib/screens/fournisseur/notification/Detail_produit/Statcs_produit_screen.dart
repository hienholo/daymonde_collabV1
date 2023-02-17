import 'package:daymonde_collaboration/screens/fournisseur/notification/Detail_produit/fournisseur_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StatistiquProduitScreen extends StatefulWidget {
  const StatistiquProduitScreen({super.key,required this.ID_PRODUCT});
  final ID_PRODUCT;
  @override
  State<StatistiquProduitScreen> createState() =>
      _StatistiquProduitScreenState();
}

final List<String> imgList = [
  'assets/images/ordi2.png',
  'assets/images/ordi3.png',
  'assets/images/ordi1.png',
  'assets/images/ordi4.png',
  'assets/images/ordi5.png',
  'assets/images/ordi6.png',
  'assets/images/ordi7.png',
  'assets/images/ordi8.png',
];
bool _star = false;
bool _radar = false;

class _StatistiquProduitScreenState extends State<StatistiquProduitScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width < 320 ? 9 : size.width == 320 ? 11 : 12;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Aperçu',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              // popupmenu item 1
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.delete_sweep_outlined),
                    SizedBox(
                      // sized box with width 10
                      width: 15,
                    ),
                    Text("Supprimer")
                  ],
                ),
              ),
              // popupmenu item 2
            ],
            position: PopupMenuPosition.under,
            offset: Offset(0, 8),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        elevation: 0,
      ),
      //
      //
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    'assets/images/ordi2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                //sphiral icon
                Positioned(
                  top: 10,
                  right: 4,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.white)

                        // boxShadow: const [
                        //   BoxShadow(
                        //       spreadRadius: 0.5,
                        //       blurRadius: 0.5,
                        //       offset: Offset(0.5, 0.5),
                        //       color: Colors.black),
                        // ],
                        ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _radar = !_radar;
                        });
                      },
                      child: Icon(
                        _star ? Icons.radar : Icons.radar_outlined,
                        color: _radar ? Colors.blue : Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                //etoil icon
                Positioned(
                  top: 50,
                  right: 4,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.white)

                        // boxShadow: const [
                        //   BoxShadow(
                        //       spreadRadius: 0.5,
                        //       blurRadius: 0.5,
                        //       offset: Offset(0.5, 0.5),
                        //       color: Colors.black),
                        // ],
                        ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _star = !_star;
                        });
                      },
                      child: Icon(
                        _star ? Icons.star : Icons.star_outline,
                        color: _star ? Colors.yellow : Colors.yellowAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //multiple images
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 10),
              child: Container(
                decoration: BoxDecoration(),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    height: 100,
                    aspectRatio: 4.0,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                  ),
                  itemCount: (imgList.length / 2).round(),
                  itemBuilder: (context, index, realIdx) {
                    final int first = index * 2;
                    final int second = first + 1;
                    // final int third = second + 3;
                    return Row(
                      children: [first, second].map((idx) {
                        return Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                // top: 8.0, left: 10, right: 10
                                ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              margin: const EdgeInsets.only(
                                  top: 2, left: 2, right: 2),
                              child: Image.asset(imgList[idx],
                                  height: 90, fit: BoxFit.cover),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
            Center(
              child: RichText(
                // textAlign: TextAlign.left,
                text: const TextSpan(
                  text: 'Ordinateur portable HP FOLIO ....\n',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Le titre de l'article ici couleur gise noire",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            // 1e cadre
            Card(
              margin:
                  const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 4),
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black54,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
                    //
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('CARACTERISTIQUES PRINCIPALES'),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: const TextSpan(
                          text: "Dell Triplex 3060 Micro Desktop\n",
                          style:
                              TextStyle(color: Color.fromARGB(255, 40, 39, 39)),
                          children: [
                            TextSpan(
                                text:
                                    'Intel 6-Core-i5-8500T 2.1GHz Upto 3.5GHz\n'),
                            TextSpan(text: '8GB DDR4 RAM\n'),
                            TextSpan(text: '500GB DD\n'),
                            TextSpan(text: 'HDMI, Display Port\n'),
                            TextSpan(text: 'Wi-FI, Bluetooth\n'),
                            TextSpan(text: 'Windows 10 Pro'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //2eme cadre
            Card(
              margin:
                  const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 4),
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black54,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
                    //
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('INFORMATION'),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 20, bottom: 25),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: const TextSpan(
                                  text: "Catégorie \n\n",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 40, 39, 39)),
                                  children: [
                                    TextSpan(text: 'Sous-catégorie\n\n'),
                                    TextSpan(text: 'Etat du produit\n\n'),
                                    TextSpan(text: 'Localisation\n\n'),
                                    TextSpan(text: 'Nombre de pièces\n\n'),
                                    TextSpan(text: 'Numéro de téléphone:'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4, top: 20, bottom: 25),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: const TextSpan(
                                  text: "Informatique\n\n",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 5, 65, 169),
                                  ),
                                  children: [
                                    TextSpan(text: 'Ordinateur portable\n\n'),
                                    TextSpan(text: 'Importer\n\n'),
                                    TextSpan(text: 'Yamoussoukro, 220Lgt\n\n'),
                                    TextSpan(text: '8 pièces\n\n'),
                                    TextSpan(text: ' +225 59 02 85 45'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //affiche texte prix
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 50, left: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'PRIX OFFICIEL',
                            style: TextStyle(
                                color: Colors.black, fontSize: fontsize),
                            children: const [
                              TextSpan(
                                text: ' 450,000 FCFA',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   "Reçu : 10.Jan.2022  10:12",
                        //   style: TextStyle(fontSize: 10),
                        // ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 2),
                    child: Container(
                      width: size.width * 0.01,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: const Text(''),
                    ),
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'PRIX PARTENAIRE',
                            style: TextStyle(
                                color: Colors.black, fontSize: fontsize),
                            children: const [
                              TextSpan(
                                text: ' 400,000 FCFA',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FournisseurBottomNavBar(selectedIndex : 5,ID_PRODUCT: widget.ID_PRODUCT,),
    );
  }
}
