// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../components/ValiderBage/ScanButton.dart';
import '../../const/color.dart';

class ValiderBadge extends StatefulWidget {
  const ValiderBadge({Key? key}) : super(key: key);

  @override
  State<ValiderBadge> createState() => _ValiderBadgeState();
}

class _ValiderBadgeState extends State<ValiderBadge> {
  @override
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
 
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
                  const Text("Scanner le code QR sur le packet daymond pro \npour validé votre badge",
                  textAlign: TextAlign.center,
                  style:  TextStyle(fontSize: 18),),
                  
                        Expanded( 
                    flex: 5,
                    child: buildQrView(context)
                    ),
        
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ScanButton(text: "Scanner",press: (){
                      Navigator.pushNamed(context, "ValiderBadge");
                    },),
                  ),
                   const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(top:10.0,bottom: 20),
                    child: Text("Votre badge été certifié avec succè",
                    textAlign: TextAlign.center,
                    style:  TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right:size.width*0.4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(onPressed: (){}, child: const Text("Contacter le service", style:  TextStyle(fontSize: 15,color: blue,fontWeight: FontWeight.bold))),
                        TextButton(onPressed: (){}, child: const Text("Code QR invalide", style:  TextStyle(fontSize: 15,color:blue,fontWeight: FontWeight.bold))),
                      ],
                    ),
                  )
            ],
          ),
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