// ignore_for_file: file_names, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPFORM extends StatefulWidget {
   OTPFORM({Key? key, required this.textEditingController}) : super(key: key);
 TextEditingController textEditingController = TextEditingController();
  @override
  State<OTPFORM> createState() => _OTPFORMState();
}

class _OTPFORMState extends State<OTPFORM> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
   String currentText = "";
  @override
  Widget build(BuildContext context) {
    return Form(
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
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: textEditingController,
      onCompleted: (v) {
      print("Completed");
      print(textEditingController.text);
      },
      onChanged: (value) {
      print(value);
      setState(() {
        currentText = value;

      });
      },
      beforeTextPaste: (text) {
      print("Allowing to paste $text");
      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
      //but you can show anything you want here, like your pop up saying wrong paste format or etc
      return true;
      }, 
    ),
    
    );
  }
}