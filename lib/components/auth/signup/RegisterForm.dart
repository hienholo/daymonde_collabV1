// ignore_for_file: file_names, unused_import, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously, override_on_non_overriding_member
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/components/DefaultButton.dart';
import 'package:daymonde_collaboration/components/TextFIeldContainer.dart';
import 'package:daymonde_collaboration/screens/recruteur/auth/code_confirme_recruteur.dart';
import 'package:daymonde_collaboration/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daymonde_collaboration/components/input/CostumInput.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

import '../../../models/apiReponse.dart';
import '../../../models/user_model.dart';
import '../../input/CountryPicker.dart';
import '../../input/InputEmail.dart';
import '../../input/InputPassword.dart';
import '../../input/InputPhoneNumber.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  bool isloading = false;
  String error = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController EmailController = TextEditingController();
  TextEditingController VilleController = TextEditingController();
  TextEditingController NomController = TextEditingController();
  TextEditingController PrenomController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController ProfessionController = TextEditingController();
  TextEditingController countryValue = TextEditingController();
  TextEditingController PasswordControler = TextEditingController();
  TextEditingController RepeatPasswordControler = TextEditingController();
  bool remember = false;
  @override
  

  void RegisterParrain() async {
    showAlertDialogConnexion(context);
    new Timer(const Duration(seconds: 5), () async {
      ApiResponse response = await Register(
        NomController.text.trim(),
        PrenomController.text.trim(),
        EmailController.text.trim(),
        PhoneNumberController.text.trim(),
        countryValue.text,
        VilleController.text.trim(),
        ProfessionController.text.trim(),
        PasswordControler.text.trim(),
      );
      if (response.error == null) {
        Navigator.pop(context);
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          title: 'Votre compte a été créé',
          desc:   'redirection en cours.......',
          btnOkOnPress: () {},
        )..show();
        new Timer(const Duration(seconds: 5), () async {
          setState(() async {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>ValisationCompteRecruteurScreen(code_otp : null)), (route) => false);
          });
        });
      }
      else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.error}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            backgroundColor: Colors.red,));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: TextFieldContainer(
                          child: CostumInput(
                              Controller: PrenomController, Label: "Prénom"),
                        ),
                      )),
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: TextFieldContainer(
                          child: CostumInput(
                              Controller: NomController,
                              Label: "Nom de famille"),
                        ),
                      ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      children: [
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.only(
                            right: 5,
                          ),
                          child: CountryPicker(
                            countryValue: countryValue,
                          ),
                        )),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: TextFieldContainer(
                            child: CostumInput(
                              Controller: VilleController,
                              Label: 'Ville',
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InputPhoneNumber(
                      PhoneNumberController: PhoneNumberController,
                      Label: "Numéro de téléphone",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InputEmail(
                        EmailController: EmailController,
                        Label: 'Entrez votre Email'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child:  TextFieldContainer(
                      child: CostumInput(
                          Controller: ProfessionController,
                          Label: "Profession"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InputPassword(
                      PasswordControler: PasswordControler,
                      Label: ' Mot de passe',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: InputPassword(
                      PasswordControler: PasswordControler,
                      Label: 'Entrez à nouneau le mot de passe',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: DefaultButton(
                        text: "S'inscrire",
                        couleur: remember ? blue: grey,
                        press: remember ? () {
                          if(_formKey.currentState!.validate()){
                            RegisterParrain();
                          }
                        }: null ),
                  ),
                ],
              )),
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
        Container(margin: EdgeInsets.only(left: 5),child:Text("Réquette en cours", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}