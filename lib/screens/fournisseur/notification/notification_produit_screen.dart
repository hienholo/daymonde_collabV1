import 'package:carousel_slider/carousel_slider.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
class NotificationProduitScreen extends StatefulWidget {
  const NotificationProduitScreen({Key? key}) : super(key: key);

  @override
  State<NotificationProduitScreen> createState() => _NotificationProduitScreenState();
}

class _NotificationProduitScreenState extends State<NotificationProduitScreen> {
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
  bool _achatsoi = false;
  bool _star = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width < 320 ? 9 : size.width == 320 ? 11 : 12;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              'Avant',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Switcher(
              value: false,
              size: SwitcherSize.small,
              switcherButtonRadius: 50,
              enabledSwitcherButtonRotate: true,
              iconOff: Icons.lock,
              iconOn: Icons.lock_open,
              colorOff: Colors.blueGrey.withOpacity(0.3),
              colorOn: blue,
              onChanged: (bool state) {
               setState(() {
                 _achatsoi = state;
               });
                print(_achatsoi);
              },
            )
          ],
        ),
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
                //etoil icon
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
              padding: const EdgeInsets.only(top: 20,  left: 8),
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
                                style: TextStyle(color:Colors.red),
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
            SizedBox(height: 20,),
            _achatsoi ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 12, 57, 238),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Appeler",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 12, 57, 238),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Accorder",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ) : Container(),
          ],
        ),
      ),

    );
  }
}
