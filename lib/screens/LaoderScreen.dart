import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:daymonde_collaboration/connectivity/check_connexion.dart';
import 'package:flutter/material.dart';

class LoaderPageScreen extends StatefulWidget {
  LoaderPageScreen({Key ? key,}) : super(key: key);
  @override
  _LoaderPageScreenState createState() => new _LoaderPageScreenState();
}

class _LoaderPageScreenState extends State<LoaderPageScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Loading
        Positioned(
          child: Container(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ),

          )
        ),
      ],
    );
  }
}

