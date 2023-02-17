import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class BadgeCertifier extends StatefulWidget {
  const BadgeCertifier({super.key});

  @override
  State<BadgeCertifier> createState() => _BadgeCertifierState();
}

class _BadgeCertifierState extends State<BadgeCertifier> {
  String data1 = '';
  String data2 = '';
  String data3 = '';
  String data4 = '';
  String data5 = '';
  String data6 = '';
  //
  textData() async {
    String text1;
    String text2;
    String text3;
    String text4;
    String text5;
    String text6;
    //
    text1 = await rootBundle.loadString('files/Text1_badgecert.txt');
    text2 = await rootBundle.loadString('files/Text2_badgecert_vend.txt');
    text3 = await rootBundle.loadString('files/Text3_badgecert_vend.txt');
    text4 = await rootBundle.loadString('files/Text4_badgecert_vend.txt');
    text5 = await rootBundle.loadString('files/Text5_badgecert_vend.txt');
    text6 = await rootBundle.loadString('files/Text1_badgecert_fournis.txt');
    //
    setState(() {
      data1 = text1;
      data2 = text2;
      data3 = text3;
      data4 = text4;
      data5 = text5;
      data6 = text6;
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
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          title: Container(
            padding: const EdgeInsets.only(top: 45),
            alignment: Alignment.topCenter,
            child: const Text(
              'BADGE CERTIFIE',
              style: TextStyle(fontSize: 15),
            ),
          ),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Text(
                      'RECRUTEUR VENDEUR',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 12, 19, 247),
                      ),
                    ),
                  ),
                  //
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, bottom: 20),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                              padding:
                                  EdgeInsets.only(top: 8, bottom: 8, right: 8),
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
                        const Text(
                          '100%',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 4,
                            right: 6,
                          ),
                          child: Text(data2),
                        ),
                      ],
                    ),
                  ),

                  //
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                              padding:
                                  EdgeInsets.only(top: 8, bottom: 8, right: 8),
                              child: Icon(
                                Icons.lens_rounded,
                                color: Colors.black,
                                size: 8,
                              ),
                            ),
                            Text(
                              'Quels sont les avantages?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 4, bottom: 10, top: 10),
                          child: Text(data3),
                        ),
                        // 1
                        Container(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 80),
                                      child: const Text(
                                        '1.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Text(data4),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //2
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Container(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: const Text(
                                        '2.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                        'L\'augmentation de vos gains a plus de 100%'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //3
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: const Text(
                                        '3.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                      'Adhésion à la liste des utilisateurs privilégiés\nde Daymond',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //4
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: const Text(
                                        '4.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                        'Présentation professionnelle à l\'aide des\noutils mis à disposition.'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // 5
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 98),
                                      child: const Text(
                                        '5.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: data5,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                          children: const [
                                            TextSpan(
                                              text:
                                                  'Tee-shirt, Polo,\nCasquette, Badge professionnel et un\nCode de validation pour un badge certifié.',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 8),
                          child: const Text(
                            'Voir les accessoires',
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //
            //FOURNISSEUR
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Text(
                      'RECRUTEUR FOURNISSEUR',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 12, 19, 247),
                      ),
                    ),
                  ),
                  //
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, bottom: 20),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                              padding:
                                  EdgeInsets.only(top: 8, bottom: 8, right: 8),
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
                        const Text(
                          '100%',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 6),
                          child: Text(data2),
                        ),
                      ],
                    ),
                  ),
                  //
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, bottom: 20),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                              padding:
                                  EdgeInsets.only(top: 8, bottom: 8, right: 8),
                              child: Icon(
                                Icons.lens_rounded,
                                color: Colors.black,
                                size: 8,
                              ),
                            ),
                            Text(
                              'Quels sont les avantages?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 4, bottom: 10, top: 10),
                          child: Text(data3),
                        ),
                        // 1
                        Container(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 60),
                                      child: const Text(
                                        '1.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: data6,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                          children: const [
                                            TextSpan(
                                              text:
                                                  '(Tee-shirt, Polo,\nCasquette, Badge professionnel et un\nCode de validation pour un badge certifié.)',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 8),
                          child: const Text(
                            'Voir les accessoires',
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        ),

                        //2
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 32),
                                      child: const Text(
                                        '2.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                        'Gagner 1.000 FCFA sur chaque produit\nvalidé par mission spéciale au lieu de\n500 FCFA.'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //3

                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: const Text(
                                        '3.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                      'Présentation professionnelle à l\'aide des\noutils mis à disposition.',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //4
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: const Text(
                                        '4.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                      'Adhésion à la liste des utilisateurs privilégiés\nde Daymond',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // 5
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Container(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: const Text(
                                        '5.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                        'L\'augmentation de vos gains a plus de 100%'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
