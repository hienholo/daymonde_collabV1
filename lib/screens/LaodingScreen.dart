import 'dart:async';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/screens/OnboardingSceen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/homeFournisseur.dart';
import 'package:daymonde_collaboration/screens/recruteur/ProfileScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/auth/code_confirme_recruteur.dart';
import 'package:daymonde_collaboration/screens/recruteur/auth/loginScreen.dart';
import 'package:daymonde_collaboration/services/user_services.dart';
import 'package:flutter/material.dart';
import '../const/color.dart';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  static const routeNane = 'laoding';
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  /////////////////// FUNCTION LOGIN AUTH
  void _loadUserInfo() async {
    String token =  await getToken();
    String role_as = await getRole();
    String EmailValidateStatus = await getVerifyStatus();
    if (token == '') {
      // ignore: use_build_context_synchronously
      if(EmailValidateStatus != ''){
        new Timer(const Duration(seconds: 4), () {
          setState(() {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>ValisationCompteRecruteurScreen(code_otp : null)), (route) => false);
          });
        });
      }else{
        new Timer(const Duration(seconds: 4), () {
          setState(() {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()), (route) => false);
          });
        });
      }
    }else{
      ApiResponse  response = ApiResponse();
      if(response.error == null){
        new Timer(const Duration(seconds: 4), () {
          setState(() {
            role_as == 'ROLE_RECRUTEUR' ? Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>ProfileScreen()), (route) => false): '';
            role_as == 'ROLE_FOURNISSEUR' ? Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeFournisseur()), (route) => false): '';
          });
        });
      }
    }

  }
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
        color: primary,
        child:Image.asset('assets/images/logo.png', fit: BoxFit.contain)
    );
  }
}

