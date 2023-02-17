// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'package:daymonde_collaboration/components/auth/login/loginForm.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

import '../../../components/auth/signup/RegisterForm.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int TabBarIndexValue = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        primary: true,
        iconTheme: const IconThemeData(color: primary),
        title: Text(
          ('devenir recruteur').toUpperCase(),
          style: const TextStyle(color: primary,fontSize: 18),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logindaymond.png',
                  width: 150,
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                      labelColor: const Color.fromARGB(255, 47, 48, 47),
                      automaticIndicatorColorAdjustment: true,
                      isScrollable: false, // Required
                      labelStyle:
                      TextStyle(fontSize: size.width < 350 ? 16 : 25),
                      unselectedLabelColor: const Color.fromARGB(
                          255, 138, 136, 136), // Other tabs color
                      labelPadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      indicatorSize:
                      TabBarIndicatorSize.label, // Space between tabs
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                            color: blue, width: 4), // Indicator height
                        // Indicator width
                      ),
                      tabs: const [
                        Tab(
                            child: Padding(
                              padding: EdgeInsets.only(left: .0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "S'identifier",
                                  maxLines: 1,style: TextStyle(fontSize: 16)
                                ),
                              ),
                            )),
                        Tab(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                "S'inscrire",
                                maxLines: 1,style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                      onTap: (index) {
                        setState(() {
                          TabBarIndexValue = index;
                        });
                      },
                    ),
                  ),
                ),
                Visibility(
                    visible: TabBarIndexValue == 0, child: LoginForm()),
                Visibility(
                    visible: TabBarIndexValue == 1, child: const RegisterForm())
              ],
            ),
          ),
        ),
      ),
    );
  }
}