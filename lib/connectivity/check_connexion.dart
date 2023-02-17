import 'package:connectivity/connectivity.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/LaoderScreen.dart';
import 'package:flutter/material.dart';
class CheckConnexion extends StatefulWidget {
  const CheckConnexion({Key? key, required this.widget_componet}) : super(key: key);
  final widget_componet;
  @override
  State<CheckConnexion> createState() => _CheckConnexionState();
}

class _CheckConnexionState extends State<CheckConnexion> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (BuildContext ctxt,
            AsyncSnapshot<ConnectivityResult> snapShot) {
          var result = snapShot.data;
          if(result != null){
            switch (result) {
              case ConnectivityResult.none:
                print("no net");
                return Center(child: Text("No Internet Connection!"));
              case ConnectivityResult.mobile:
              case ConnectivityResult.wifi:
                print("yes net");
                return widget.widget_componet;
              default:
                return ErrorConnexion();
            }
          }else{
            return  ErrorConnexion();
          }
          return LoaderPageScreen();
        });
  }
  
}

class ErrorConnexion extends StatelessWidget {
  const ErrorConnexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Image.asset('assets/images/Groupe 125.png',width: 250,),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                child: TextButton(
                  onPressed: () {  },
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Réessayer',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blue,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}



