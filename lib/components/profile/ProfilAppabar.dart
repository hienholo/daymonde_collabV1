// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:daymonde_collaboration/components/searchbar.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/screens/notifications/notification_screen.dart';
import 'package:daymonde_collaboration/screens/recruteur/profilRecrutScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class ProfilAppbar extends StatefulWidget {
   ProfilAppbar({Key? key,required this.DialogCompte}) : super(key: key);
Widget DialogCompte;
  @override
  State<ProfilAppbar> createState() => _ProfilAppbarState();
}

class _ProfilAppbarState extends State<ProfilAppbar> {
  String? photo;
  getUserDetails() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    int id_recruteur = pre.getInt('userId') ?? 0;
    String myUrl = "$userDetailURL?id_user=${id_recruteur}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['recruteur_infos'];
      print(jsonResponse);
      ////////////// SET DATA IN SESSION ////////
      pre.setString('photo', jsonResponse['photo']);
    } else {
      throw Exception('Failed to load album');
    }
  }
  void loadInfo() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      photo = pre.getString('photo');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>ProfilRecrut()));
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: blue,
                      ),
                      child: photo == null ? Image.network(
                        'https://www.pngall.com/wp-content/uploads/12/Avatar-PNG-Images.png',
                        fit: BoxFit.cover,
                      ) : Image.network('${FILE_PATH_USER}/${photo}'),
                    ),
                  ),
                 widget.DialogCompte
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        showSearch(
                            context: context, delegate: CustomSearchDelegate());
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black87,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>NotificationScreen()));
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.black87,
                      ))
                ],
              )
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
