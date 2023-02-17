// ignore_for_file: avoid_print

import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

enum RecrutChoice { vendeurs, fournisseurs, deux }

class SelectAccount extends StatefulWidget {
  const SelectAccount({Key? key}) : super(key: key);

  @override
  State<SelectAccount> createState() => _SelectAccountState();
}

class _SelectAccountState extends State<SelectAccount> {
  bool isDisabled = true;
  RecrutChoice? _recrutChoice;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title:  Container(
                child: Column(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Text('Inscription reussie',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    Center(
                      child: SizedBox(
                        width: 50,
                        child: Divider(color: blue,thickness: 2,),
                      ),
                    ),
                  ],
                ),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children:  <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Text('Votre inscription a été effectuée avec succès'),
                    ),
                  ],
                ),
              ),
              actions: [
                Divider(color: Colors.grey,),
                Center(
                  child: InkWell(
                    onTap: ()=> Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                      ),
                      child: Text('Okey',style: TextStyle(color: blue,fontWeight: FontWeight.bold,fontSize: 14),),
                    ),
                  ),
                ),

              ],
            );
          },
        );


    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        primary: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: primary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, bottom: 20.0, right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/recrutment.png',
                          width: size.width < 350 ? 80 : 100,
                          height: size.width < 350 ? 80 : 100,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: size.width < 350 ? 10 : 20),
                          child: Text(
                            'Sélectionner un compte',
                            style:
                                TextStyle(fontSize: size.width < 350 ? 18 : 25),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: size.width < 350 ? 10 : 60.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        const BoxShadow(
                                            offset: Offset(1, 1),
                                            blurRadius: 4,
                                            color: Colors.grey)
                                      ]),
                                  child: RadioListTile<RecrutChoice>(
                                      value: RecrutChoice.vendeurs,
                                      groupValue: _recrutChoice,
                                      title: Text(
                                          'Recruter des ${RecrutChoice.vendeurs.name}',
                                          style: const TextStyle(fontSize: 20)),
                                      onChanged: (val) {
                                        setState(() {
                                          _recrutChoice = val;
                                          isDisabled = false;
                                          print(_recrutChoice);
                                        });
                                      }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        const BoxShadow(
                                            offset: Offset(1, 1),
                                            blurRadius: 4,
                                            color: Colors.grey)
                                      ]),
                                  child: RadioListTile<RecrutChoice>(
                                      value: RecrutChoice.fournisseurs,
                                      groupValue: _recrutChoice,
                                      // ignore: prefer_interpolation_to_compose_strings
                                      title: Text(
                                        'Recruter des ${RecrutChoice.fournisseurs.name}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      onChanged: (val) {
                                        setState(() {
                                          _recrutChoice = val;
                                          isDisabled = false;
                                          print(_recrutChoice);
                                        });
                                      }),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: size.width < 350 ? 60 : 0),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(1, 1),
                                            blurRadius: 4,
                                            color: Colors.grey)
                                      ]),
                                  child: RadioListTile<RecrutChoice>(
                                      value: RecrutChoice.deux,
                                      groupValue: _recrutChoice,
                                      title: Text(
                                          'Recruter les ${RecrutChoice.deux.name}',
                                          style: const TextStyle(fontSize: 20)),
                                      onChanged: (val) {
                                        setState(() {
                                          _recrutChoice = val;
                                          isDisabled = false;
                                          print(_recrutChoice);
                                        });
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(size.width < 350 ? 5 : 20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child:  TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: isDisabled ? grey : primary),
            onPressed: isDisabled ? null : () {
                    Navigator.pushNamed(context, 'ProfilScrenn',
                        arguments: {'screenTitle': 'ambassadeur'});
                  },
            child: Padding(
              padding: EdgeInsets.all(size.width < 350 ? 5 : 8.0),
              child: Text(
                'Ouvrir',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
