// ignore_for_file: non_constant_identifier_names, file_names, unused_local_variable
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/components/DefaultButton.dart';
import 'package:daymonde_collaboration/components/TextFIeldContainer.dart';
import 'package:daymonde_collaboration/components/input/CostumInput.dart';
import 'package:daymonde_collaboration/components/input/InputEmail.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/screens/recruteur/ProfileScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/auth/code_confirme_recruteur.dart';
import 'package:daymonde_collaboration/services/vendeurs_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../input/CountryPicker.dart';
import '../input/InputPhoneNumber.dart';
import '../input/InputWhatsAppPhoneNumber.dart';


class AddSellerForm extends StatefulWidget {
  const AddSellerForm({Key? key}) : super(key: key);
  @override
  State<AddSellerForm> createState() => _AddSellerFormState();
}

class _AddSellerFormState extends State<AddSellerForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController NomController = TextEditingController();
  TextEditingController PrenomController = TextEditingController();
  TextEditingController PrefessionController = TextEditingController();
  TextEditingController countryValue = TextEditingController();
  TextEditingController VilleController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController WhatsAppPhoneNumberController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  String code_otp = '01234';
  bool remember = false;
  void addSellers()async{
    showAlertDialogConnexion(context);
    new Timer(const Duration(seconds: 5), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      ApiResponse response = await AddSellersRequest(
          NomController.text.trim(),
          PrenomController.text.trim(),
          PhoneNumberController.text.trim(),
          WhatsAppPhoneNumberController.text.trim(),
          VilleController.text.trim(),
          PrefessionController.text.trim(),
          EmailController.text.trim(),
          PhoneNumberController.text.trim()
      );
      if(response.error == null && StatusCode == 200){
        Navigator.pop(context);
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title:   Container(
                height: 30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/like.png')
                    )
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
                      child: Column(
                        children: [
                          Text('${NomController.text} ${PrenomController.text}',style: TextStyle(fontSize: 20,color: blue),textAlign: TextAlign.center,),
                          Text('A été ajouté avec succès')
                        ],
                      ),
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
                      child: Text('Ok',style: TextStyle(color: blue,fontWeight: FontWeight.bold,fontSize: 14),),
                    ),
                  ),
                ),

              ],
            );
          },
        );
        new Timer(const Duration(seconds: 3), () async {
          setState(() {
            pref.setString('VERIF_EMAIL',  EmailController.text.trim());
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ValisationCompteRecruteurScreen(code_otp: null,)));
          });
        });
      }else{
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
      child: Padding(
        padding: const EdgeInsets.only(top:60.0 ,left:20,right: 20 ),
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
                            Controller: PrenomController,
                            Label: "Prénom"),
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
                  padding: const EdgeInsets.only(top: 15),
                  child: CostumInput(
                    Controller: PrefessionController,
                    Label: ' Prefession',),
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
               InputWhatsAppPhoneNumber(
                 WhatsAppPhoneNumberController: WhatsAppPhoneNumberController,) ,
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,top: 15),
                  child:  InputEmail(
                      EmailController: EmailController,
                      Label: 'Entrez votre Email'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, bottom: 20),
                  child: DefaultButton(
                      text: "Inscription",
                      couleur: Color(0xffFFC000),
                      press: () {
                        if(_formKey.currentState!.validate()){
                          showAlertDialogConnexion(context);
                            addSellers();
                        }
                      }),
                ),
              ],
            )),
          ],
        ),
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