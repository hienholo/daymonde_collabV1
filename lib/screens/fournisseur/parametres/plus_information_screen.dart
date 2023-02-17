import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class PlusinfoFournisseurDaymond extends StatefulWidget {
  const PlusinfoFournisseurDaymond({super.key});

  @override
  State<PlusinfoFournisseurDaymond> createState() =>
      _PlusinfoFournisseurDaymondState();
}

class _PlusinfoFournisseurDaymondState
    extends State<PlusinfoFournisseurDaymond> {
  String data1 = '';
  String data2 = '';
  String data3 = '';
  String data4 = '';
  String data5 = '';
  String data6 = '';
  String data7 = '';
  String data8 = '';
  //
  //
  textData() async {
    String text1;
    String text2;
    String text3;
    String text4;
    String text5;
    String text6;
    String text7;
    String text8;

    //
    text1 = await rootBundle.loadString('files/Text1_fourn_daymond.txt');
    text2 = await rootBundle.loadString('files/Text2_fourn_daymond.txt');
    text3 = await rootBundle.loadString('files/Text3_fourn_daymond.txt');
    text4 = await rootBundle.loadString('files/Text4_fourn_daymond.txt');
    text5 = await rootBundle.loadString('files/Text5_fourn_daymond.txt');
    text6 = await rootBundle.loadString('files/Text6_fourn_daymond.txt');
    text7 = await rootBundle.loadString('files/Text7_fourn_daymond.txt');
    text8 = await rootBundle.loadString('files/Text4_fourn_daymond.txt');

    //
    setState(() {
      data1 = text1;
      data2 = text2;
      data3 = text3;
      data4 = text4;
      data5 = text5;
      data6 = text6;
      data7 = text7;
      data8 = text8;
    });
  }

  @override
  void initState() {
    textData(); //set the initial value of text field

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          title: Container(
            padding: const EdgeInsets.only(top: 45),
            alignment: Alignment.topCenter,
            child: const Text(
              'Plus d\'informations',
              style: TextStyle(fontSize: 15),
            ),
          ),
          elevation: 2,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 15, top: 20, bottom: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Text(
                'FOURNISSEUR DAYMOND',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          child: Column(
            children: [
              //'Qu\'est ce que c\'est ?',
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                          child: Icon(
                            Icons.lens_rounded,
                            color: Colors.black,
                            size: 8,
                          ),
                        ),
                        Text(
                          'Qu\'est ce que c\'est ?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, right: 6, top: 10),
                      child: Text(data1),
                    ),
                  ],
                ),
              ),

              //Comment ça marche ?
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                          child: Icon(
                            Icons.lens_rounded,
                            color: Colors.black,
                            size: 8,
                          ),
                        ),
                        Text(
                          'Comment ça marche ?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    //
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, right: 6, top: 10),
                      child: RichText(
                        text: TextSpan(
                          text: data2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          children: [
                            const TextSpan(
                              text: ' Ajouter un produit ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(
                              text: '+\n',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: data3,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, right: 6, top: 10),
                      child: Text(data4),
                    ),
                    //
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, right: 6, top: 10),
                      child: Text(data5),
                    ),
                  ],
                ),
              ),

              //Gestion des commandes
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                          child: Icon(
                            Icons.lens_rounded,
                            color: Colors.black,
                            size: 8,
                          ),
                        ),
                        Text(
                          'Gestion des commandes',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, right: 6, top: 10),
                      child: RichText(
                        text: TextSpan(
                          text: data6,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          children: const [
                            TextSpan(
                              text: 'Nouvelles ',
                              style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextSpan(text: 'commandes, Commandes '),
                            TextSpan(
                              text: 'En préparations',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextSpan(text: ', Commandes '),
                            TextSpan(
                              text: 'Prés pour livraisons',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextSpan(text: ', Commandes '),
                            TextSpan(
                              text: 'Terminées',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextSpan(text: ' et Commandes '),
                            TextSpan(
                              text: 'Annulées',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Gestion des livraisons
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                          child: Icon(
                            Icons.lens_rounded,
                            color: Colors.black,
                            size: 8,
                          ),
                        ),
                        Text(
                          'Gestion des livraisons',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, right: 6, top: 10),
                      child: Text(data7),
                    ),
                  ],
                ),
              ),

              // Quels sont les avantages ?
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                          child: Icon(
                            Icons.lens_rounded,
                            color: Colors.black,
                            size: 8,
                          ),
                        ),
                        Text(
                          'Quels sont les avantages ?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, right: 6, top: 10),
                      child: RichText(
                        text: const TextSpan(
                          text:
                              'Vos avantages sont multiples, car travailler avec daymond c\'est d\'avoir la possibilité d\'accroitre votre chiffre d\'affaires de',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text: ' 40% ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: 'en moins de 3 mois.'),
                          ],
                        ),
                      ),
                    ),
                    //
                    RichText(
                      text: const TextSpan(
                        text: '-',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                ' La chance de vendre 3 fois plus vite que le nome gratuitement.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    //
                    RichText(
                      text: const TextSpan(
                        text: '-',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                'La possibilité de vendre vos produits partout dans votre pays et même à l\'international gratuitement.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    //
                    RichText(
                      text: const TextSpan(
                        text: '-',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                'De travailler avec des experts sur une plateforme de gestion et de suivi de vos commandes de manière professionnelle et cela gratuitement.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Comment rémunérer Daymond pour tous ces efforts
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                          child: Icon(
                            Icons.lens_rounded,
                            color: Colors.black,
                            size: 8,
                          ),
                        ),
                        Text(
                          'Comment rémunérer Daymond pour\ntous ces efforts',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 4, right: 6, top: 10),
                      child: Text(
                          'Vous n\'avez pas à vous inquiéter car vous ne payez rien. C\'est plutôt le client qui paie Daymond.'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
