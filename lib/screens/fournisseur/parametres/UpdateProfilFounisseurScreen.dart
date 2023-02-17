import 'dart:io';

import 'package:daymonde_collaboration/components/fournisseur/profil/updateProfilForm.dart';
import 'package:daymonde_collaboration/components/image_view.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class UpdateProfilFounisseurScreen extends StatefulWidget {
  const UpdateProfilFounisseurScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfilFounisseurScreen> createState() => _UpdateProfilFounisseurScreenState();
}

class _UpdateProfilFounisseurScreenState extends State<UpdateProfilFounisseurScreen> {
  File? imageRegistre1;
  _getImages() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageRegistre1 = File(pickedFile.path);
      });
    }
  }
  List<Map<String, dynamic>> gridMap =[
    {
      'url':'assets/images/calque.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text("Modifier les informations",style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 40,),
          Container(
            child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Stack(
                        children: [
                          imageRegistre1 == null ?
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  color: Colors.blue.withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80.0),
                              child: InkWell(
                                onTap: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SliderShowFullmages(image: gridMap),
                                  ),
                                )),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 4, color: Colors.blue),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          color: Colors.blue.withOpacity(0.1),
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/images/calque.png'),
                                      )

                                  ),
                                ),
                              ),
                            ),
                          )
                              :
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  color: Colors.blue.withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80.0),
                              child: InkWell(
                                onTap: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SliderShowFullmages(image: gridMap),
                                  ),
                                )),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 4, color: Colors.blue),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          color: Colors.blue.withOpacity(0.1),
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(imageRegistre1!),
                                      )

                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 40,
                            right: 5,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2, color: blue),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    spreadRadius: 0.5,
                                    blurRadius: 0.5,
                                    offset: Offset(0.5, 0.5),
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: ()=> _getImages(),
                                child: const Icon(
                                  Icons.add,
                                  color: blue,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('Ajouter une photo de profil'),
                    ),
                  )
                ]),
          ),

          Padding(
            padding: EdgeInsets.all(12),
            child: UpdateProfilFournisseurForm(),
          )
        ],
      ),
    );
  }
}


