// ignore_for_file: file_names

import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

class AppBarCode extends StatefulWidget {
  const AppBarCode({ Key? key }) : super(key: key);

  @override
  State<AppBarCode> createState() => _AppBarCodeState();
}

class _AppBarCodeState extends State<AppBarCode> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
       preferredSize: const Size.fromHeight(100.0),
       child:AppBar(
        primary: true,
        title: const Text('Confirmation du compte', style: TextStyle(color: primary),),
        iconTheme: const IconThemeData(color:primary),
      ),
    );
  }
}