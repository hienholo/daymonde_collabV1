import 'dart:async';

import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/LaodingScreen.dart';
import 'package:daymonde_collaboration/screens/OnboardingSceen.dart';
import 'package:daymonde_collaboration/screens/fournisseur/auth/loginScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/AddFournisseur.dart';
import 'package:daymonde_collaboration/screens/recruteur/AddSellerScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/BadgeCertifie.dart';
import 'package:daymonde_collaboration/screens/recruteur/CallCenter.dart';
import 'package:daymonde_collaboration/screens/recruteur/ConditionUsing.dart';
import 'package:daymonde_collaboration/screens/recruteur/ProfileScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/SettingsRecruteur.dart';
import 'package:daymonde_collaboration/screens/recruteur/auth/loginScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/auth/selectAccount.dart';
import 'package:daymonde_collaboration/screens/recruteur/chatBox.dart';
import 'package:daymonde_collaboration/screens/recruteur/moreInfos.dart';
import 'package:daymonde_collaboration/screens/recruteur/productView.dart';
import 'package:daymonde_collaboration/screens/recruteur/profilRecrutScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/recrutFournisseur.dart';
import 'package:daymonde_collaboration/screens/recruteur/recrutNotificationScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/statistiquesScreen.dart';
import 'package:daymonde_collaboration/screens/recruteur/validerBadge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/ValiderBage/ScanCodeQR.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue),
      routes: <String, WidgetBuilder>{
        //"/": (context) => const OnboardingScreen(),
        "LoginScreen": (context) => const LoginScreen(),
        "LoginFournisseurScreen": (context) => const LoginFournisseurScreen(),
        "ScanPage": (context) => const ScanPage(),
        "ProfilScrenn": (context) => const ProfileScreen(),
        "AddSellerScrenn": (context) => const AddSellerScrenn(),
        "Statistiques": (context) => const Statistiques(),
        "SelectAccount": (context) => const SelectAccount(),
        "SettingsRecruteur": (context) => const SettingsRecruteur(),
        "MoreInfos": (context) => const MoreInfos(),
        "ProfilRecrut": (context) => const ProfilRecrut(),
        "RecrutNotifications": (context) => const RecrutNotifications(),
        "ChatBox": (context) => const ChatBox(),
        "CentreAssistant": (context) => const CentreAssistant(),
        "ConditionUsing": (context) => const ConditionUsing(),
        "BadgeCertifie": (context) => const BadgeCertifie(),
        "ValiderBadge": (context) => const ValiderBadge(),
        "ScanPage": (context) => const ScanPage(),
        "AddFournisseur": (context) => const AddFournisseur(),

      },
    );
  }
 
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => OnboardingScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: primary,
        child:Image.asset('assets/images/logo.png', fit: BoxFit.contain)
    );
  }
}

