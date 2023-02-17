// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:convert';
import 'package:daymonde_collaboration/screens/recruteur/detailVendeur.dart';
import 'package:http/http.dart' as http;

import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/const/userData.dart';
import 'package:daymonde_collaboration/models/vendeur_by_niveau_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/profile/ProfilCard.dart';

class LevelStats extends StatefulWidget {
  const LevelStats({Key? key,
    required this.title,
    required this.niveaux,
    required this.count_level,
  }) : super(key: key);
  final title;
  final niveaux;
  final count_level;
  @override
  State<LevelStats> createState() => _LevelStatsState();
}

class _LevelStatsState extends State<LevelStats> {
  DateTime now = DateTime.now();
  String ? formatedDate;
  Future<List<ModelVendeurByNiveaux>> getVendeursByNiveaux() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int id_recruteur = pref.getInt('userId') ?? 0;
    String myUrl = "$getVendeursByNiveauxURL?id_recruteur=${id_recruteur}&&niveaux_increment=${widget.count_level}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse['vendeurs_by_niveaux']);
      var data = jsonResponse['vendeurs_by_niveaux'].cast<Map<String, dynamic>>();
      return data.map<ModelVendeurByNiveaux>((json) => ModelVendeurByNiveaux.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  late Future<List<ModelVendeurByNiveaux>> futureVendeurByNiveaux;
@override
  void initState() {
    // TODO: implement initState
  futureVendeurByNiveaux = getVendeursByNiveaux();
  initializeDateFormatting('fr_FR', null).then((_) => now);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: light,
      appBar: AppBar(
        backgroundColor: bludeBold,
        centerTitle: true,
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 30),
        ),
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.niveaux,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(60)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.8,
                child: FutureBuilder<List<ModelVendeurByNiveaux>>(
                  future: futureVendeurByNiveaux,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, i) {
                            DateTime date = DateTime.parse(snapshot.data![i].vendeur_add!);
                            var formatter = new DateFormat('EEE d MMM y HH:mm ', 'fr_FR');
                            var now = DateTime.now();
                            var currentTime = DateFormat('EEE d MMM y HH:mm','fr_FR').format(now);
                            formatedDate = formatter.format(date);
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailVendeur(
                                    Nom_vendeur: '${snapshot.data![i].name}',
                                    Prenoms_vendeur: '${snapshot.data![i].prenom}',
                                    Date_add_vendeur: '${formatedDate}',
                                    Pays_vendeur: '${snapshot.data![i].pays}',
                                    Numeros_vendeur: '${snapshot.data![i].contact}',
                                    ID_vendeur: '${snapshot.data![i].id_user}',
                                    Villes_vendeur: '${snapshot.data![i].ville}',
                                    Niveaux_base_vendeur: '${snapshot.data![i].niveaux_base}',
                                    Niveaux_increment_vendeur: '${snapshot.data![i].niveaux_increment}',
                                  )));
                                },
                                child: ProfilCard(
                                  date: currentTime.compareTo(formatedDate!) < 0 ? "${DateFormat('HH:mm','fr_FR').format(now)} min":'${formatedDate}',
                                  itemCount: users.length,
                                  name: '${snapshot.data![i].name} ${snapshot.data![i].prenom}',
                                  value: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.whatsapp,
                                      color: Colors.green,
                                      size: size.width < 350 ? 25 : 35,
                                    ),
                                  ),
                                  profilPicture: '${FILE_PATH_USER}/${snapshot.data![i].photo}',
                                  CardColor: Colors.white,
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
