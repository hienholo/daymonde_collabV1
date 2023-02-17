// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable, file_names, use_build_context_synchronously

import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/components/input/InputPassword.dart';
import 'package:daymonde_collaboration/components/input/InputPhoneNumber.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/models/user_model.dart';
import 'package:daymonde_collaboration/screens/fournisseur/homeFournisseur.dart';
import 'package:daymonde_collaboration/screens/recruteur/ProfileScreen.dart';
import 'package:daymonde_collaboration/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../DefaultButton.dart';
import '../../TextFIeldContainer.dart';

class LoginForm extends StatefulWidget {
   LoginForm({Key? key,}) : super(key: key,);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
  ///////////////: funton login user ///////////

  void loginUser() async {
    showAlertDialogConnexion(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    new Timer(const Duration(seconds: 5), () async {
        ApiResponse response = await Login(PhoneNumberController.text.trim(), PasswordControler.text.trim());
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
    var textInputType = const TextInputType.numberWithOptions(signed: true, decimal: true);
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  TextFieldContainer(
                      child: InputPhoneNumber(
                    PhoneNumberController: PhoneNumberController,
                        Label: "Numéro de téléphone",
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldContainer(
                      child: InputPassword(
                    PasswordControler: PasswordControler,
                    Label: 'Tapez votre mot de passe',
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                  DefaultButton(
                    text: "S'identifier",
                    press: () {
                     if(_formKey.currentState!.validate()){
                         loginUser();
                     }
                    },
                     // ignore: unrelated_type_equality_checks
                     //widget.role=='ambassadeur'? Navigator.pushNamed(context, "CodeConfirmPage"):widget.role=='recruteur'?Navigator.pushNamed(context, "CodeConfirmPage"):Navigator.pushNamed(context, "CodeConfirmPage");
                     // if (_formKey.currentState!.validate()) {

                      // }
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
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