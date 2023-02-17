import 'dart:async';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/screens/recruteur/ProfileScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/auth/loginScreen.dart';
import 'package:daymonde_collaboration/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ValisationCompteRecruteurScreen extends StatefulWidget {
  const ValisationCompteRecruteurScreen({Key? key, required this.code_otp}) : super(key: key);
  final code_otp;
  @override
  State<ValisationCompteRecruteurScreen> createState() => _ValisationCompteRecruteurScreenState();
}

class _ValisationCompteRecruteurScreenState extends State<ValisationCompteRecruteurScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";
  bool _isLoading = false;
  String text = "";
  String ? Email;
  String? token;
  Future<void> VerifyEmail() async {
     token =  await getToken();
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      Email = pref.getString('VERIF_EMAIL');
      print(Email);
    });
  }
  Future <void> VerificationCompte() async{
    showAlertDialogConnexion(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    new Timer(const Duration(seconds: 5), () async {
      Navigator.pop(context);
      ApiResponse response =  await daymondOptForm(textEditingController.text.trim());
      if(response.error == null && StatusCode == 200){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Votre compte a été créé',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          backgroundColor: Colors.green,));
        new Timer(const Duration(seconds: 5), () async {
          setState(() async {
            prefs.remove('VERIF_STATUS');
            if(token !=''){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>ProfileScreen()), (route) => false);
            }else{
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
            }

          });
        });
      }else{
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.error}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          backgroundColor: Colors.red,));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ValisationCompteRecruteurScreen(code_otp: null,)));
      }

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    VerifyEmail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Padding(
          padding: EdgeInsets.only(right: 40),
          child: Text('Confirmation du compte',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children:<Widget> [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Image.asset('assets/images/img3.png'),
          ),
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  RichText(
                    text: TextSpan(
                      children:  <TextSpan>[
                        TextSpan(text: 'Saisissez le code de verification qui vous a été envoyé par sur : ',style: TextStyle(color: Colors.black,fontSize: 18)),
                        TextSpan(text: '${Email}', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              //OTPFORM(textEditingController: textEditingController,),
               Form(
                child: PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  appContext: context,
                  length: 5,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  pinTheme: PinTheme(
                    borderWidth: 2,
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveColor: Colors.white,
                    disabledColor: Colors.white,
                    inactiveFillColor: Colors.white,

                  ),
                  keyboardType: TextInputType.number,
                  animationDuration: const Duration(milliseconds: 100),
                  enableActiveFill: true,
                  controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                    VerificationCompte();
                    },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                        print(widget.code_otp);
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),

              ),
            ],
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget> [
              InkWell(
                onTap: (){},
                child: Text('Renvoyer le code',style: TextStyle(fontSize: 18),),
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget> [
              InkWell(
                onTap: (){},
                child: Text('Consulter ma boite mail',style: TextStyle(fontSize: 18)),
              )
            ],
          ),

          SizedBox(height: 80,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: textEditingController.text.length ==5 ? Color(0xffFFC000) : grey,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                  ),
                ),
                onPressed: textEditingController.text.length == 5 ? () {
                  VerificationCompte();
                   /*if(widget.code_otp == null){
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(32.0))),
                            contentPadding: const EdgeInsets.only(top: 10.0),
                            title: Column(
                              children: [
                                Text(
                                  "Numéo de confirmation incorrect entrer le bon numéro ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 5,
                                        offset: Offset(2, 1),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'Entrer le bon numéro',
                                      labelStyle: TextStyle(fontSize: 16),
                                      focusColor: Colors.black,
                                      contentPadding: const EdgeInsets.all(12),
                                      border: const OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 0.3)
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ce champ est requis';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            content: Container(
                              width: 300.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 10.0,
                                  ),

                                  const SizedBox(
                                    height: 40,
                                  ),
                                  InkWell(
                                    child: Container(
                                      padding:
                                      const EdgeInsets.only(
                                          top: 10.0, bottom: 10.0),
                                      decoration: const BoxDecoration(
                                        color: blue,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0)),
                                      ),
                                      child: const Text(
                                        "Valider",
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }*/
                } : null,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Confirmer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )),
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
        Container(margin: EdgeInsets.only(left: 5),child:Text("Confirmation en cours", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}