import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/models/retrait_model.dart';
import 'package:daymonde_collaboration/screens/portefeuilles/portefeuille_screen.dart';
import 'package:daymonde_collaboration/services/portefeuille_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClickNumeroRetraitScreen extends StatefulWidget {
  const ClickNumeroRetraitScreen({
        super.key,
        required this.image,
        required this.operateur,
        required this.numero
      });
  final String image;
  final String operateur;
  final String numero;
  @override
  State<ClickNumeroRetraitScreen> createState() =>
      _ClickNumeroRetraitScreenState();
}

class _ClickNumeroRetraitScreenState extends State<ClickNumeroRetraitScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _all = false;
  String? soldeTotal;
  final montantController =  TextEditingController();
  void loadInfos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      soldeTotal = prefs.getString('soldeTotal');
    });
  }
  void setDemandeRetrait()async{
    showAlertDialogDemande(context);
    new Timer(const Duration(seconds: 5), () async {
      Navigator.pop(context);
      ApiResponse response = await DemandeRetraits(
          _all ? montantController.text = '${soldeTotal}' : montantController.text.trim(),
          widget.numero,
          widget.operateur
      );
     if(response.error == null && StatusCode == 200){
       AwesomeDialog(
         context: context,
         animType: AnimType.bottomSlide,
         dialogType: DialogType.success,
         body: Center(
           child: Text("Votre demande de retrait est en cours de traitement ...",
             style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold),
             textAlign: TextAlign.center,
           ),
         ),
         btnOkOnPress: () {
           Navigator.push(context,
               MaterialPageRoute(builder: (context)=>PortefeuilleFournisseurScreen()));
         },
       )..show();
     }else{
       Navigator.pop(context);
       AwesomeDialog(
           context: context,
           animType: AnimType.scale,
           dialogType: DialogType.error,
           title: 'Oopp !!!',
           desc:   '${response.error}',
           btnOkOnPress: () {},
           btnOkColor: Colors.red
       )..show();

     }

    });

  }
  @override
    void initState() {
      // TODO: implement initState
    loadInfos();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(1, 22, 103, 10),
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/portefeuille.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 25,
                          child:  Text(
                            'SOLDES ACTUEL : ${soldeTotal} CFA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //back
                Positioned(
                  top: 30,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    widget.image,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.operateur} money',
                                  style: const TextStyle(fontSize: 17),
                                ),
                                Text(
                                  widget.numero,
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                            maxLines: 1,
                            style: const TextStyle(fontSize: 20),
                            keyboardType: TextInputType.number,
                            enabled: _all == true ? false: true,
                            controller: _all ?  TextEditingController(text: '${soldeTotal}') : montantController ,
                            decoration: const InputDecoration(
                              suffix: Text(
                                'Fr',
                                style: TextStyle(fontSize: 20),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Montant à rétirer',
                              hintText: '10 000',
                              labelStyle: TextStyle(color: Colors.blue),
                              focusColor: Colors.blue,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer un montant';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Retirer gratuitement et à tout moment',
                              style: TextStyle(color: Colors.black38, fontSize: 13),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Tout rétirer',
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    value: _all,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _all = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                ),
              ),
              onPressed: (){
               if(_formKey.currentState!.validate()){
                 setDemandeRetrait();
               }
              },
               child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "ENVOYEZ LA DEMANDE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}


void showAlertDialogDemande(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(color: blue,),
        Container(margin: EdgeInsets.only(left: 5),child:Text("Demande en cours", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}