// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable, file_names, use_build_context_synchronously

import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/components/input/InputPassword.dart';
import 'package:daymonde_collaboration/components/input/InputPhoneNumber.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/functions.dart';
import 'package:daymonde_collaboration/screens/fournisseur/homeFournisseur.dart';
import 'package:daymonde_collaboration/screens/recruteur/ProfileScreen.dart';
import 'package:daymonde_collaboration/services/user_services.dart';
import 'package:flutter/material.dart';
import '../../../models/apiReponse.dart';



class LoginFormFournisseur extends StatefulWidget {
  LoginFormFournisseur({Key? key}) : super(key: key,);
  @override
  State<LoginFormFournisseur> createState() => _LoginFormFournisseurState();
}

class _LoginFormFournisseurState extends State<LoginFormFournisseur> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController PasswordControler = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 4),
        () => 'Data Loaded',
  );
  bool visibl = true;
  bool remember = false;
  bool isloading = false;

  void loginUser() async {
    showAlertDialogConnexion(context);
    new Timer(const Duration(seconds: 5), () async {
      ApiResponse response = await Login(
          PhoneNumberController.text.trim(),
          PasswordControler.text.trim());
      if(response.error == null){
        Navigator.pop(context);
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          title: 'Connexion reussie',
          desc:   'redirection en cours.......',
          btnOkOnPress: () {},
        )..show();
        new Timer(const Duration(seconds: 4), () async {
          Navigator.pop(context);
          String role_as = await getRole();
          role_as == 'ROLE_RECRUTEUR' ? Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>ProfileScreen()), (route) => false): '';
          role_as == 'ROLE_FOURNISSEUR' ? Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeFournisseur()), (route) => false): '';
        });

      }else{
        Navigator.pop(context);
        AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.error,
            title: 'Oopp !!!',
            desc:   '${response.error}, veuilez verifiez vos informations de connexion',
            btnOkOnPress: () {},
            btnOkColor: Colors.red
        )..show();

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var textInputType =
        const TextInputType.numberWithOptions(signed: true, decimal: true);
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 12,
                      right: 12,
                      left: 12
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 0.0,
                                      blurRadius: 0.0,
                                      offset: Offset(0.5, 0.5),
                                      color: Colors.grey),
                                ],
                              ),
                              child: InputPhoneNumber(
                                  PhoneNumberController:PhoneNumberController,
                                  Label:'Numéro de téléphone')
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 12,
                      right: 12,
                      left: 12
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: Offset(0.5, 0.5),
                                  color: Colors.grey),
                            ],
                          ),
                          child: InputPassword(
                              PasswordControler:PasswordControler,
                              Label: 'Tapez votre mot de passe'),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: Checkbox(
                                materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                                value: remember,
                                activeColor: blue,
                                onChanged: (bool? value) {
                                  setState(() {
                                    remember = !remember;
                                  });
                                },
                              ),
                            ),
                            const Text("Se souvenir de moi"),
                          ],
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/mot_de_passe_oublie');
                          },
                          // ignore: prefer_const_constructors
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: const Text(
                              "Mot de passe oublié",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: blue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: size.width,
                    height: 60,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        primary: Colors.white,
                        backgroundColor: blue,
                      ),
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          showAlertDialogConnexion(context);
                          new Timer(const Duration(seconds: 5), () {
                            setState(() async {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>HomeFournisseur()));
                            });
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Se connecter',
                          style: TextStyle(
                            fontSize: (18),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showAlertDialogConnexion(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(color: blue,),
        Container(margin: EdgeInsets.only(left: 5),child:Text("Connexion en cours", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}