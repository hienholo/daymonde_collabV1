// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../const/color.dart';
import 'ScanButton.dart';


class ScanPage extends StatefulWidget {
  const ScanPage({ Key? key }) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String Erreur='';
  final qrkey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;
  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }
  @override
  void reassemble() async{
    super.reassemble();
    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }
 
  @override
  Widget build(BuildContext context) {
    var size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color:bludeBold,size: 30),
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: const Text("valider le badge",style: TextStyle(color: blue, fontWeight: FontWeight.bold),),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
           
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
        child: Image.asset('assets/images/badge-CERTIFIER 1.png',width: 40,)
        ),
      ),
      
        body: Column(
          children: [
             const Text("Scanner le code QR sur le packet daymond pro \npour validé votre badge",
                  textAlign: TextAlign.center,
                  style:  TextStyle(fontSize: 18),),
            Expanded( 
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: buildQrView(context),
              )
              ),
            
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ScanButton(text: "Scanner",press: (){
                      setState(() {
                        
                      });
                    },),
                  ),
                   const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(top:10.0,bottom: 20),
                    child: Text("Votre badge été certifié avec succè",
                    textAlign: TextAlign.center,
                    style:  TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: (){}, child: const Text("Contacter le service", style:  TextStyle(fontSize: 15,color: blue,fontWeight: FontWeight.bold))),
                      TextButton(onPressed: (){}, child: const Text("Code QR invalide", style:  TextStyle(fontSize: 15,color:blue,fontWeight: FontWeight.bold))),
                    ],
                  )
            
          ],
        ),
      ),
    );
  }
  Widget buildQrView(BuildContext context)=>QRView(
    key: qrkey, 
    cameraFacing: CameraFacing.unknown,
    onQRViewCreated: onQRViewCreated,
    overlay:QrScannerOverlayShape(
      borderLength: 20,
      borderWidth: 10,
      borderRadius: 10,
      cutOutSize: MediaQuery.of(context).size.width*0.8,
    ),
    );
   

  void onQRViewCreated( QRViewController controller) {
    setState(() {
      this.controller=controller;
      controller.scannedDataStream.listen((barcode) { 
        setState(() {
          this.barcode=barcode;
          if (barcode.code!=null) {
            controller.pauseCamera();
            
          }
        });

      });
    });
    Future.delayed(Duration(minutes: 2));

  }

  Widget buildResult()=>Center(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          barcode!=null?'Resulat ${barcode?.code}':'Scannez le code',
          maxLines: 3,
        ),
      ),
    ),
  );

  Widget buildControlButtons()=> Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white24
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            icon: FutureBuilder<bool?>(
              future: controller?.getFlashStatus(),
              builder: (context,snapshot){
                if (snapshot.data !=null) {
                  return Icon(
                    snapshot.data!? Icons.flash_on:Icons.flash_off);
                } else {
                  return Container();
                }
              }) ,
           onPressed: () async{
              await controller?.toggleFlash();
              setState(() { });
            }, 
            ),
            IconButton(onPressed:
            () async{
              await controller?.flipCamera();
              setState(() { });
            }, 
            icon:FutureBuilder(
              future: controller?.getCameraInfo(),
              builder: (context,snapshot){
                if (snapshot.data !=null) {
                  return Icon(
                    Icons.switch_camera);
                } else {
                  return Container();
                }
              })  
            ) 
            // Icon(Icons.switch_camera)
      ],
    ),
  );
  }

