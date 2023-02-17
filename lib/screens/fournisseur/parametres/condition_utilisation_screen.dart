import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ConditionUtilisationScreen extends StatefulWidget {
  const ConditionUtilisationScreen({super.key});

  @override
  State<ConditionUtilisationScreen> createState() =>
      _ConditionUtilisationScreenState();
}

class _ConditionUtilisationScreenState
    extends State<ConditionUtilisationScreen> {
  String data1 = '';
  String data2 = '';
  String data3 = '';

  //
  //
  textData() async {
    String text1;
    String text2;
    String text3;

    //
    text1 =
        await rootBundle.loadString('files/Text1_condition_utilisateur.txt');
    text2 =
        await rootBundle.loadString('files/Text2_condition_utilisateur.txt');
    text3 =
        await rootBundle.loadString('files/Text3_condition_utilisateur.txt');

    //
    setState(() {
      data1 = text1;
      data2 = text2;
      data3 = text3;
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        title: Container(
          padding: const EdgeInsets.only(top: 45),
          alignment: Alignment.topCenter,
          child: const Text(
            'Condition Generale',
            style: TextStyle(fontSize: 15),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 15, top: 20, bottom: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Text(
                  'IMPORTANT',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              //

              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Comme condition de votre utilisation de daymond collaboration vous acceptez',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    //  1

                    Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: RichText(
                        text: const TextSpan(
                          text: '1/',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text:
                                  'De Fournir vos articles au prix de grossiste (prix réduis) a l\'agence daymond, en prennent compte des prix sur le marché.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //  2
                    Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: '2/',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: data1,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Noter bien
                    Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: 'Noter bien',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: data2,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // 3
                    Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: '3/',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
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
