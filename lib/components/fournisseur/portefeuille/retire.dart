
import 'dart:async';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/models/retrait_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:daymonde_collaboration/screens/portefeuilles/details_retraits_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FournisseurRetraitWidget extends StatefulWidget {
  const FournisseurRetraitWidget({super.key});

  @override
  State<FournisseurRetraitWidget> createState() => _FournisseurRetraitWidgetState();
}

class _FournisseurRetraitWidgetState extends State<FournisseurRetraitWidget> {
  DateTime now = DateTime.now();
  String ? formatedDate ;
  String ? soldeTotal ;
  /////////////////////// GET ALL RETRAIT //////////////
  Future<List<RetraitModel>> getAllRetaits() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int user_id = pref.getInt('userId') ?? 0;
    String myUrl = "$getAllRetraits?user_id=${user_id}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse['transaction']);
      var data = jsonResponse['transaction'].cast<Map<String, dynamic>>();
      setState(() {
        soldeTotal = pref.getString('soldeTotal');
      });
      return data.map<RetraitModel>((json) => RetraitModel.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  late Future<List<RetraitModel>> futureRetrait;
  @override
  void initState() {
    // TODO: implement initState
    futureRetrait  = getAllRetaits();
    initializeDateFormatting('fr_FR', null).then((_) => now);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric( horizontal: 4),
        color: Colors.grey.shade100,
        child: SizedBox(
          height: size.height * 0.67,
          child: FutureBuilder<List<RetraitModel>>(
            future: futureRetrait,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      DateTime date = DateTime.parse(snapshot.data![i].DATE_TRANSACTION!);
                      var formatter = new DateFormat('EEE d MMM y ', 'fr_FR');
                      formatedDate = formatter.format(date);
                      return Column(
                        children: [
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: ()=>Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> FournisseursDetailsRetraitsScreen(
                                 logo_operator:snapshot.data![i].operateur_retrait == 'Orange' ? 'assets/images/Orange.png': snapshot.data![i].operateur_retrait == 'MTN' ? 'assets/images/mtn.png' :  snapshot.data![i].operateur_retrait == 'MOOV' ? 'assets/images/moov.png':  snapshot.data![i].operateur_retrait == 'Wave' ? 'assets/images/wave.png' : '',
                                 montant_retire:'${snapshot.data![i].montant_retrait}',
                                 numero_retrait:'${snapshot.data![i].numero_retrait}',
                                 numero_refrence:'${snapshot.data![i].reference_retrait}',
                                 sold_courant:'${snapshot.data![i].somme}',
                                 date_retrait:'${formatedDate}',
                                ))),
                            child: kCardRetait(
                              context,
                              '${snapshot.data![i].type}',
                               snapshot.data![i].operateur_retrait == 'Orange' ? 'assets/images/Orange.png': snapshot.data![i].operateur_retrait == 'MTN' ? 'assets/images/mtn.png' :  snapshot.data![i].operateur_retrait == 'MOOV' ? 'assets/images/moov.png':  snapshot.data![i].operateur_retrait == 'Wave' ? 'assets/images/wave.png' : '',
                              '${formatedDate}',
                              '${snapshot.data![i].montant_retrait}',
                            ),
                          ),
                        ],
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        /*ListView(
          children: [
            SizedBox(height: 10,),
            kCardRetait(
              context,
              'Retrait',
              'assets/images/Orange.png',
              '12 Mai 2022',
              '146.899',
            ),

            kCardRetait(
              context,
              'Retrait',
              'assets/images/mtn.png',
              '12 Jan 2022',
              '14.000',
            ),
            kCardRetait(
              context,
              'Retrait',
              'assets/images/wave.png',
              '12 Mars 2022',
              '16.895',
            ),

            SizedBox(height: 60,),
          ],
        ),*/
      ),
      bottomSheet:  Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.0),
        ),
        padding: EdgeInsets.only(
            bottom: 12
        ),
        child: FutureBuilder<List<RetraitModel>>(
          future: futureRetrait,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Montant total retiré',style: TextStyle(fontSize: 16),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 10),
                    child: Text('${soldeTotal} Fcfa',style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                  Divider(color: Colors.grey,)
                ],
              );
            } else {
              return Center(child:Container());
            }
          },
        ),
      ),
    );
  }
}

Container kCardRetait(BuildContext context, String nom, final image, String minute, String commission) {
  return Container(
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
           /**
               boxShadow: [
               BoxShadow(
               color: Colors.white,
               offset: const Offset(
               5.0,
               5.0,
               ),
               blurRadius: 10.0,
               spreadRadius: 2.0,
               ), //BoxShadow//BoxShadow
               ],
            * **/
          ),
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(image),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),

                        Container(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 1,
                                      bottom: 12,
                                    ),
                                    child: Text('${nom}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: 'serif'),),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 1),
                                    child: Text('Retiré le ${minute}',style: TextStyle(color: Colors.black,fontSize: 11.5,fontStyle: FontStyle.italic,fontFamily: 'serif'),),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text('${commission} Fr',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.green,fontStyle: FontStyle.italic,fontFamily: 'sans-serif')),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
        Container(
          height: 7,
        ),

      ],
    ),
  );
}


