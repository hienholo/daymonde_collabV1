import 'package:flutter/material.dart';

import '../../const/color.dart';
class FournisseursDetailsRetraitsScreen extends StatefulWidget {
  const FournisseursDetailsRetraitsScreen({Key? key,
    required this.logo_operator,
    required this.montant_retire,
    required this.numero_retrait,
    required this.numero_refrence,
    required this.sold_courant,
    required this.date_retrait,
  }) : super(key: key);
  final logo_operator;
  final montant_retire;
  final numero_retrait;
  final numero_refrence;
  final sold_courant;
  final date_retrait;
  @override
  State<FournisseursDetailsRetraitsScreen> createState() => _FournisseursDetailsRetraitsScreenState();
}

class _FournisseursDetailsRetraitsScreenState extends State<FournisseursDetailsRetraitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: Row(
          children: [
            Text('Détails de transaction',
              style: TextStyle(color: Colors.black,fontSize: 15),),
            Spacer(),
            Text("${widget.date_retrait}",style: TextStyle(color: Colors.black,fontSize: 10),),
          ],
        ),
      ),
      body: ListView(
        children: <Widget> [
          SizedBox(height: 50,),
          Column(
            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/checked.png',width: 100,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Retrait éffectué',style: TextStyle(color: Color.fromRGBO(14, 189, 2, 100),fontSize: 30),)
                ],
              ),
            ],
          ),
          SizedBox(height: 40,),
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text('MONTANT RETIRÉ'),
                                  Padding(
                                    padding: EdgeInsets.only(right: 30,top: 4),
                                    child: Text('${widget.montant_retire} FCFA'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Column(
                                children: [
                                  Text('NUMÉRO DU RÉTRAIT'),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10,top: 4),
                                    child: Text('${widget.numero_retrait}'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Column(
                                children: [
                                  Text('REFERENCE DU RETRAIT'),
                                  Padding(
                                    padding: EdgeInsets.only(right: 40,top: 4),
                                    child: Text('${widget.numero_refrence}'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Column(
                                children: [
                                  Text('SOLDE APRÈS RETRAIT'),
                                  Padding(
                                    padding: EdgeInsets.only(right: 70,top: 4),
                                    child: Text('${widget.sold_courant}  FCFA'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          child:Image.asset("${widget.logo_operator}",)
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                  ],
                ),
              ],
            )
          ),
          SizedBox(height: 40,),
          Center(
            child: Text('Retiré le ${widget.date_retrait}'),
          ),

        ],
      ),
    );
  }
}
