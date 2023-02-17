import 'package:daymonde_collaboration/components/image_view.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
class ParrainFournisseurScreen extends StatefulWidget {
  const ParrainFournisseurScreen({
    Key? key,
    required this.ID_RECRUTEUR,
    required this.PHOTO_PARAIN,
    required this.nom_recuteur,
    required this.prenom_recuteur,
    required this.date_add_recuteur,
    required this.pays_recuteur,
    required this.ville_recuteur,
    required this.num_what_recuteur,
    required this.numbre_prod_certifie,
    required this.numbre_prod_add,

  }) : super(key: key);
  final ID_RECRUTEUR;
  final PHOTO_PARAIN;
  final nom_recuteur;
  final prenom_recuteur;
  final date_add_recuteur;
  final pays_recuteur;
  final ville_recuteur;
  final num_what_recuteur;
  final numbre_prod_certifie;
  final numbre_prod_add;


  @override
  State<ParrainFournisseurScreen> createState() => _ParrainFournisseurScreenState();
}
class _ParrainFournisseurScreenState extends State<ParrainFournisseurScreen> {
  DateTime now = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    initializeDateFormatting('fr_FR', null).then((_) => now);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> gridMap =[
      {
        'url':'${FILE_PATH_USER}/${widget.PHOTO_PARAIN}',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        toolbarHeight: 160,
        title: Text('Mon parrain',style: TextStyle(color: Colors.black),),
        actions: [
          PopupMenuButton(
            padding: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
            ),
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,

                child: Text(
                  'Rompe le lien',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            onSelected: (val) {
              _dialogRupture(context);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              child: Column(
                children: [
                  Stack(
                      children: [Column(
                        children: [
                          Container(
                            height: 100,
                            color: Color.fromRGBO(1, 22, 103, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget> [
                                Expanded(
                                  child: Text(''),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 20,top: 20),
                                      child:InkWell(
                                        child: Column(
                                          children: [
                                            Text('${widget.nom_recuteur} ${widget.prenom_recuteur}',
                                              style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                                            Padding(
                                              padding: EdgeInsets.all(6),
                                              child: Text('Membre depuis le ${FormatDate(widget.date_add_recuteur)}',
                                                style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                            )
                                          ],
                                        )
                                      )

                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(bottom: 12),
                            child:Column(
                              children: [
                                Container(
                                    child: InkWell(
                                      child: Column(
                                        children: [
                                          SizedBox(height: 40,),
                                          ListTile(
                                            leading: Image.asset('assets/images/civ.png',width: 40,),
                                            title: Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text("${widget.pays_recuteur}, ${widget.ville_recuteur}"),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.whatsapp,color: Colors.green,),
                                            title: Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: widget.num_what_recuteur == '0' ? Text('Non défini',style: TextStyle(fontSize: 18,color: Colors.green)) : Text('${widget.num_what_recuteur}',style: TextStyle(fontSize: 18,color: Colors.green),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                        Positioned(
                            left: 30,
                            top: 50,
                            child:  InkWell(
                              onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SliderShowFullmages(image: gridMap),
                                ),
                              )),
                              child:Padding(
                                padding: EdgeInsets.only(top: 1),
                                child: Stack(
                                  children: [
                                    Container(
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
                                            image: NetworkImage('${FILE_PATH_USER}/${widget.PHOTO_PARAIN}'),
                                          )

                                      ),
                                    ),
                                  ],
                                ),

                              ) ,
                            )


                        )
                      ]
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30,top: 50),
                child: Text('${widget.numbre_prod_add} produits enregistés',style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30,right:30,top: 20),
                child: Text('${widget.numbre_prod_certifie} produits validés',style: TextStyle(fontSize: 20),),
              )
            ],
          ),
        ),
      )

    );
  }
}

  _dialogRupture (BuildContext context) {
    Size size = MediaQuery.of(context).size;
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/imo.png',
            width: 80,
          ),
        ],
      ),
      content:  Text(
        'Envoyer une demande de rupture de collaboration à votre parrain',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: size.width < 321 ? 10 : 13),
      ),
      actions: <Widget>[
        const Divider(
          thickness: 2,
          color: Colors.blue,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.3,
              child: TextButton(
                onPressed: () => Navigator.pop(context, 'ANNULER'),
                child: const Text('ANNULER'),
              ),
            ),
            Container(
              width: size.width * 0.3,
              decoration:const BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.grey))),
              child: TextButton(
                onPressed: () => _dialogRuptureOkey(context),
                child: const Text('ENVOYER'),
              ),
            ),
          ],
        ),

      ],
    ),
  );
}

  _dialogRuptureOkey (BuildContext context) {
    Size size = MediaQuery.of(context).size;
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/imo.png',
            width: 80,
          ),
        ],
      ),
      content:  Text(
        'Votre demande a été envoyée à votre collaborateur avec succès en attente de son accord',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: size.width < 321 ? 10 : 13),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextButton(
                onPressed: () =>null,
                child: const Text('OK'),
              ),
            ),
          ],
        ),

      ],
    ),
  );
}