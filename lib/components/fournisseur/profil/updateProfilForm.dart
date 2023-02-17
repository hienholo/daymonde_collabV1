// ignore_for_file: file_names, unused_import, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously, override_on_non_overriding_member

import 'package:daymonde_collaboration/components/DefaultButton.dart';
import 'package:daymonde_collaboration/components/TextFIeldContainer.dart';
import 'package:daymonde_collaboration/components/fournisseur/textFielsInput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daymonde_collaboration/components/input/CostumInput.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

import '../../../functions.dart';
import '../../../models/apiReponse.dart';
import '../../../models/dataInfosGerants.dart';
import '../../../models/user_model.dart';

import '../../input/CountryPicker.dart';
import '../../input/InputEmail.dart';
import '../../input/InputPassword.dart';
import '../../input/InputPhoneNumber.dart';



class UpdateProfilFournisseurForm extends StatefulWidget {
  const UpdateProfilFournisseurForm({Key? key}) : super(key: key);

  @override
  State<UpdateProfilFournisseurForm> createState() => _UpdateProfilFournisseurFormState();
}

class _UpdateProfilFournisseurFormState extends State<UpdateProfilFournisseurForm> {


  DataInfosGerant dataInfosGerant = new DataInfosGerant();
  bool isloading = false;
  String error = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController PasswordControler = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController VilleController = TextEditingController();
  TextEditingController NomController = TextEditingController();
  TextEditingController PrenomController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController countryValue = TextEditingController();
  TextEditingController nomBoutiqueController = TextEditingController();
  TextEditingController QuartierBoutiqueCOntroller = TextEditingController();

  @override

  void _saveAndRedirectToHome(GetAuhtInfo user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('user_Session', true);
    await pref.setString('user_name',PrenomController.text + NomController.text);
    await pref.setString('user_contact', PrenomController.text );
    await pref.setString('user_email', EmailController.text);
    await pref.setString('user_pays',countryValue.text);
    await pref.setString('user_ville', VilleController.text);

    String? token = pref.getString('token');
    int? nom = pref.getInt('userId');
    bool? sesion = pref.getBool('user_Session');
    print("le token recus est $token");
    print('le nom est $nom');
    print('le nom est $sesion');
    //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const CodeConfirmPage()), (route) => false);
  }

  void RegisterParrain() async {
    setState(() {
      isloading = true;
    });
    print(countryValue.text);
    ApiResponse response = await Register(
        EmailController.text.trim(),
        PasswordControler.text.trim(),
        '${NomController.text.trim()} ${PrenomController.text.trim()}',
        PhoneNumberController.text.trim(),
        countryValue.text,
        VilleController.text.trim(),
        'yehsd');
    if (response.result == 'ok') {

      _saveAndRedirectToHome(response.data as GetAuhtInfo);
    } else {
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
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
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 5,
                            ),
                            child: TextFieldContainer(
                              child: CostumInputFiels(
                                  Controller: TextEditingController(text: "Michael"),
                                  Icon: Text(''),
                                  Label: ""),
                            ),
                          )),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: TextFieldContainer(
                              child: CostumInputFiels(
                                Controller: TextEditingController(text: "Kouamé"),
                                Label: "",
                                Icon:Text(''),
                              ),
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
                                right: 4,
                              ),
                              child: CountryPicker(
                                countryValue: countryValue,
                              ),
                            )),
                        Flexible(

                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: TextFieldContainer(
                                child: CostumInputFiels(
                                    Controller: TextEditingController(text: "Yamoussoukro"),
                                    Label: '',
                                    Icon:Text('')
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InputPhoneNumber(
                      PhoneNumberController: TextEditingController(text: ""),
                      Label: '07 59 02 85 45',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CostumInputFiels(
                        Controller: TextEditingController(text: "mrmichaelkouamé@gmail.com"),
                        Label: 'Entrez votre Email',
                        Icon: Icon(Icons.email)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InputPassword(
                      PasswordControler: TextEditingController(text: "Test0202collabo"),
                      Label: ' Mot de passe',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InputPassword(
                      PasswordControler: TextEditingController(text: "Test0202collabo"),
                      Label: 'Entrez à nouneau le mot de passe',
                    ),
                  ),
                  SizedBox(height: 20,),

                Row(
                  children: [
                    Expanded(
                        child: Divider(color: Colors.black,)
                    ),
                    Expanded(
                      flex: 3,
                      child:Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text('Information sur votre boutique',style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.black,),
                    ),
                  ],
                ),

                  Padding(
                    padding: EdgeInsets.only(top: 5,),
                    child: Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width*0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: Offset(0.2, 0.2),
                                color: Colors.grey),
                          ],
                        ),
                        child: Text('Boutique MK',style: TextStyle(color: Colors.black),)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InputPhoneNumber(
                      PhoneNumberController: TextEditingController(text: "07 59 02 85 45"),
                      Label: 'Ajouter un 2-ème numéro',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child:Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: Offset(0.5, 0.5),
                              color: Colors.white),
                        ],
                      ),
                      child:DropdownButtonFormField(
                          decoration: InputDecoration(
                              filled: true,
                              contentPadding: const EdgeInsets.all(16),
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(5.0),
                                  borderSide: BorderSide(color: Colors.white, width: 0.5)
                              )
                          ),
                          validator: (value) => value == null ? "Select a country" : null,
                          value: dataInfosGerant.selectedValue,
                          icon: Icon(Icons.expand_more),
                          onChanged: (String? newValue){
                            setState(() {
                              dataInfosGerant.selectedValue = newValue!;
                            });
                          },
                          items: dataInfosGerant.dropdownItems
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child:Container(
                      margin: EdgeInsets.only(left: 6),
                      height: 55,
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
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        controller: TextEditingController(text: "220 Logement"),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "",
                            labelStyle: TextStyle(fontSize: 16),
                            contentPadding: const EdgeInsets.all(18),
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Colors.white, width: 6)
                            )

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: DefaultButton(
                      text: "Modifier",
                      press: () => openMyAlertDialog(context),
                      /* if (_formKey.currentState!.validate()) {
                            RegisterParrain();
                          } */
                    ),
                  ),

                ],
              )),
        ],
      ),
    );
  }
}


void openMyAlertDialog(BuildContext context)  {
  // Create a AlertDialog.
  AlertDialog dialog = AlertDialog(
    title: Text("Confirmez la collaboration",textAlign: TextAlign.center,),
    content: Padding(
      padding: EdgeInsets.all(5),
      child:
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Cliquez sur  ',
          style: DefaultTextStyle.of(context).style,
          children: const <TextSpan>[
            TextSpan(text: 'OK', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
            TextSpan(text: ' pour confimer la collaboration avec Mr. '),
            TextSpan(text: 'Michael k...',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
          ],
        ),
      )
    ),
    actions: [
      Divider(color: Colors.grey,),
      Padding(
        padding: EdgeInsets.only(right: 110),
        child:  ElevatedButton(
            onPressed: () {  },
            child: SizedBox(
              width: MediaQuery.of(context).size.width *0.2,
              child: Text("Ok",textAlign: TextAlign.center,),
            ),

        ),
      )
    ],
  );
  // Call showDialog function.
  Future futureValue = showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      }
  );
  futureValue.then( (value) {
    print("Return value: " + value.toString()); // true/false
  });
}
