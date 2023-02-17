
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

import '../../components/addSeller/AddSellerForm.dart';


class AddSellerScrenn extends StatefulWidget {
  const AddSellerScrenn({Key? key,}) : super(key: key);
  @override
  State<AddSellerScrenn> createState() => _AddSellerScrennState();
}

class _AddSellerScrennState extends State<AddSellerScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(150.0),
              child: Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: AppBar(
                  backgroundColor: Colors.white,
                  titleTextStyle: const TextStyle(color: black,fontSize: 20),
                  iconTheme:const IconThemeData(color: black,size: 30),
                  primary: true,
                  title: const Text("AJOUTER UN VENDEUR",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  centerTitle: true,
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(30),
                    child:Padding(
                      padding: EdgeInsets.only( bottom:30,left:0 ),
                      child: Text("Ajouter rapidement un vendeur et profitez\n des avantages chez daymond.", textAlign: TextAlign.center,style: TextStyle(color: black,fontSize:20,))
                      ),
                    ),
          ),
              ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
             AddSellerForm(),
          ],
        ),
      ),
        );
    
  }
}