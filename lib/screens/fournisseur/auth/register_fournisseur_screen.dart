import 'package:daymonde_collaboration/components/fournisseur/auth/RegisterForm.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/fournisseur/auth/loginScreen.dart';
import 'package:flutter/material.dart';
class RegisterFournisseurScreen extends StatefulWidget {
  const RegisterFournisseurScreen({Key? key}) : super(key: key);

  @override
  State<RegisterFournisseurScreen> createState() => _RegisterFournisseurScreenState();
}

class _RegisterFournisseurScreenState extends State<RegisterFournisseurScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  grey,
        elevation: 0,
        title: Text('devenez fournisseur'.toUpperCase(),style: TextStyle(color: Colors.black),),
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
                padding: EdgeInsets.all(5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
                  child: RegisterFournisseurForm(),
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
                  MaterialPageRoute(builder: (context)=>LoginFournisseurScreen()));
            }),
            child: Text("J'ai un compte",style: TextStyle(fontSize: 20),),
          ),
        ),
      ),

    );
  }
}
