// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/components/fournisseur/auth/loginForm.dart';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/screens/fournisseur/auth/register_fournisseur_screen.dart';
import 'package:daymonde_collaboration/services/user_services.dart';
import 'package:flutter/material.dart';


import '../../../const/color.dart';


class LoginFournisseurScreen extends StatefulWidget {
  const LoginFournisseurScreen({Key? key}) : super(key: key);

  @override
  State<LoginFournisseurScreen> createState() => _LoginFournisseurScreenState();
}

class _LoginFournisseurScreenState extends State<LoginFournisseurScreen> {
  int TabBarIndexValue = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  grey,
        elevation: 0,
        title: Text('Fournisseur daymond',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    grey,
                    Colors.white10,
                    Colors.white,
                    grey,
                    Colors.white,
                  ]
              )
          ),
          child: ListView(
            children: <Widget> [
              Column(
                children: [
                  Container(
                    child: Image.asset('assets/images/add_fournisseur.png'),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  width: MediaQuery.of(context).size.width *0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(1, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget> [
                      Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 12,bottom: 2),
                                child: Text("Connexion",style: TextStyle(fontSize: 20),),
                              ),
                              Container(
                                width: 30,
                                child:Divider(color: Colors.grey, thickness: 2,) ,
                              )
                            ],
                          )
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8,
                            right: 8,
                            left: 8
                        ),
                        child: LoginFormFournisseur(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Center(
          child: InkWell(
            onTap: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>RegisterFournisseurScreen()));
            }),
            child: Text("Créer un compte",style: TextStyle(fontSize: 20),),
          ),
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