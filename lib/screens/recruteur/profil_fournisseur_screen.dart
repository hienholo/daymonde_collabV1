import 'package:daymonde_collaboration/components/image_view.dart';
import 'package:flutter/material.dart';
class ProfilFounisseurScreen extends StatefulWidget {
  const ProfilFounisseurScreen({Key? key,
    required this.photo_fournisseur,
    required this.Nom_fournisseur,
    required this.Prenoms_fournisseur,
    required this.Boutique_fournisseur,
    required this.ID_FOURNISSEUR,
    required this.pays_fournissur,
    required this.ville_fournissur,
    required this.numero_fournissur,
    required this.email_fournissur,
    required this.quartier_etablissement,
    required this.localisation_fournissur,
  }) : super(key: key);
  final photo_fournisseur;
  final Nom_fournisseur;
  final Prenoms_fournisseur;
  final Boutique_fournisseur;
  final ID_FOURNISSEUR;
  final pays_fournissur;
  final ville_fournissur;
  final numero_fournissur;
  final email_fournissur;
  final localisation_fournissur;
  final quartier_etablissement;
  @override
  State<ProfilFounisseurScreen> createState() => _ProfilFounisseurScreenState();
}

class _ProfilFounisseurScreenState extends State<ProfilFounisseurScreen> {
  bool _infosBoutique = false;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> gridMap =[
      {
        'url':'${widget.photo_fournisseur}',
      },
    ];
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          toolbarHeight: 80,
          title: Text('Mon profil',style: TextStyle(color: Colors.black),),
          actions: [
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.more_vert,color: Colors.white),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                    value: 0,
                    child: ListTile(
                      dense: true,
                      leading: Icon(Icons.edit),
                      title: Text("Epingler"),
                    )
                ),
                PopupMenuItem(
                    value: 1,
                    child: ListTile(
                      dense: true,
                      title: Text("Rompre le lien"),
                      leading:Icon(Icons.delete) ,
                    )
                ),
              ],
              onSelected: (val) {
                if(val == 0){

                }else if(val== 2){

                }else if(val == 3){

                }
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(170.0),
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(1, 22, 103, 10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget> [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        InkWell(
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
                                                border: Border.all(width: 4, color: Colors.white),
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
                                                  image: NetworkImage('${widget.photo_fournisseur}'),
                                                )

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(right: 20,top: 20),
                                      child:InkWell(
                                          child: Column(
                                            children: [
                                              Text('${widget.Nom_fournisseur} ${widget.Prenoms_fournisseur}',
                                                style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                                              Padding(
                                                padding: EdgeInsets.only(left: 20,top: 2),
                                                child: Text("${widget.Boutique_fournisseur}",style: TextStyle(color: Colors.white),),
                                              ),
                                            ],
                                          )
                                      )

                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 12),
                child:Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 6,left: 1),
                      child:ListTile(
                        leading: Image.asset('assets/images/civ.png',width: 40,),
                        title:  Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text("${widget.pays_fournissur}, ${widget.ville_fournissur}",style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6,left: 1),
                      child:ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(left: 1),
                          child:  Icon(Icons.call,color: Colors.black,),
                        ),
                        title:  Padding(
                          padding: EdgeInsets.only(left: 1),
                          child: Text('${widget.numero_fournissur}',style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6,left: 1),
                      child:ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child:  Icon(Icons.email,color: Colors.black,),
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('${widget.email_fournissur}',style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            InkWell(
              onTap: (){
                setState(() {
                  _infosBoutique =! _infosBoutique;
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 40),
                    child: Text("Boutique",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 20,right: 20),
                    child: Icon(Icons.expand_more,size: 30,),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey,),
            _infosBoutique ?
            Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 40),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6,top: 6),
                                child: Text('Nom',
                                  style: TextStyle(fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6,top: 6),
                                child: Text("${widget.Boutique_fournisseur}",
                                  style: TextStyle(fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 40),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6,top: 6),
                                child: Text('Contact',
                                  style: TextStyle(fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6,top: 6),
                                child: Text("${widget.numero_fournissur}",
                                  style: TextStyle(fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 40),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6,top: 6),
                                child: Text('Ville',
                                  style: TextStyle(fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(

                          child:Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text("${widget.localisation_fournissur}",
                              style: TextStyle(fontSize: 16,),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 40),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6,top: 6),
                                child: Text('Quartier',
                                  style: TextStyle(fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6,top: 6),
                                child: Text("${widget.quartier_etablissement}",
                                  style: TextStyle(fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ) : Text(''),

          ],
        )

    );
  }
}
