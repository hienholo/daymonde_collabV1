import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daymonde_collaboration/components/input/InputPhoneNumber.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/models/portefeuille_model.dart';
import 'package:daymonde_collaboration/screens/portefeuilles/ClickNumeroRetraitScreen.dart';
import 'package:daymonde_collaboration/services/portefeuille_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FournisseurPortefeuilleRetraitScreen extends StatefulWidget {
  const FournisseurPortefeuilleRetraitScreen({super.key});

  @override
  State<FournisseurPortefeuilleRetraitScreen> createState() =>
      _FournisseurPortefeuilleRetraitScreenState();
}

class _FournisseurPortefeuilleRetraitScreenState extends State<FournisseurPortefeuilleRetraitScreen> {
  DateTime now = DateTime.now();
  bool _orange = true;
  bool _moov = false;
  bool _mtn = false;
  bool _wave = false;
  bool _same_number = false;
  String ? formatedDate;
  final _formKey = GlobalKey<FormState>();
  TextEditingController contact1Controller = TextEditingController();
  TextEditingController contact2Controller = TextEditingController();
  void AddContactsTransaction()async{
    showAlertDialogConnexion(context);
    if(contact1Controller.text.trim() == contact2Controller.text.trim()){
      _same_number = false;
      String operateur =  _orange ? 'Orange' : _wave ? 'Wave':_mtn? 'MTN':_moov? 'MOOV' : '';
      new Timer(const Duration(seconds: 5), () async {
        ApiResponse response = await AddContactransactionRequest(contact1Controller.text.trim(), operateur);
        if(response.error == null && StatusCode == 200){
          Navigator.pop(context);
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            title: 'Félicitation ....',
            desc:   'Contact ajouté avec succès',
            btnOkOnPress: () {},
          )..show();
          new Timer(const Duration(seconds: 5), () async {
            setState(() async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>FournisseurPortefeuilleRetraitScreen()));
            });
          });
        }else{
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${response.error}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            backgroundColor: Colors.red,));
        }
      });
    }else{
      setState(() {
        _same_number = true;
      });
    }
  }
  /////////////////////// GET ALL RETRAIT //////////////
  Future<List<ContactTransaction>> GetAllContactTransaction() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int user_id = pref.getInt('userId') ?? 0;
    String myUrl = "$getAllContactTransaction?user_id=${user_id}";
    final response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse['contacts']);
      var data = jsonResponse['contacts'].cast<Map<String, dynamic>>();
      return data.map<ContactTransaction>((json) => ContactTransaction.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  late Future<List<ContactTransaction>> futureAllContactTransaction;
  @override
  void initState() {
    futureAllContactTransaction = GetAllContactTransaction();
    initializeDateFormatting('fr_FR', null).then((_) => now);
    // TODO: implement initState
    super.initState();
  }
  Future addNumber(BuildContext context) => showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Dialog(
        insetPadding: const EdgeInsets.only(
          right: 20,
          left: 20,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.6,
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 35,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.bottomCenter,
                          child: const Text(
                            'Enregistrer un compte',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black54,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 10,
                      left: 20,
                      right: 20,
                    ),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Selectionner l\'operateur',
                      style: TextStyle(fontSize: 16),
                    ),
                  ), //opateru
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 1,
                            ),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: _orange ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _orange = true;
                                  _mtn = false;
                                  _moov = false;
                                  _wave = false;
                                });
                              },
                              child: Container(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color:
                                      Color.fromARGB(36, 158, 158, 158),
                                      blurRadius: 5,
                                      offset: Offset(1, 2),
                                    ),
                                    BoxShadow(
                                      color:
                                      Color.fromARGB(54, 158, 158, 158),
                                      blurRadius: 5,
                                      offset: Offset(2, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/Orange.png'),
                                    const Text('Orange')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 1,
                            ),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: _wave ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _orange = false;
                                  _mtn = false;
                                  _moov = false;
                                  _wave = true;
                                });
                              },
                              child: Container(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color:
                                      Color.fromARGB(36, 158, 158, 158),
                                      blurRadius: 5,
                                      offset: Offset(1, 2),
                                    ),
                                    BoxShadow(
                                      color:
                                      Color.fromARGB(54, 158, 158, 158),
                                      blurRadius: 5,
                                      offset: Offset(2, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                        'assets/images/wave.png'),
                                    const Text('Wave')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 1,
                            ),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: _mtn ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _orange = false;
                                  _mtn = true;
                                  _moov = false;
                                  _wave = false;
                                });
                              },
                              child: Container(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color:
                                      Color.fromARGB(36, 158, 158, 158),
                                      blurRadius: 5,
                                      offset: Offset(1, 2),
                                    ),
                                    BoxShadow(
                                      color:
                                      Color.fromARGB(54, 158, 158, 158),
                                      blurRadius: 5,
                                      offset: Offset(2, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/mtn.png'),
                                    const Text('MTN')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 1,
                            ),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: _moov ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _orange = false;
                                  _mtn = false;
                                  _moov = true;
                                  _wave = false;
                                });
                              },
                              child: Container(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color:
                                      Color.fromARGB(36, 158, 158, 158),
                                      blurRadius: 5,
                                      offset: Offset(1, 2),
                                    ),
                                    BoxShadow(
                                      color:
                                      Color.fromARGB(54, 158, 158, 158),
                                      blurRadius: 5,
                                      offset: Offset(2, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/moov.png'),
                                    const Text('Moov')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Column(
                        children: [
                          Container(
                            padding:
                             EdgeInsets.symmetric(vertical: 5),
                            child: InputPhoneNumber(
                                Label: 'Numéro de téléphone',
                                PhoneNumberController:contact1Controller
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.symmetric(vertical: 5),
                            child:InputPhoneNumber(
                                Label: 'Confirmer numéro de téléphone',
                                PhoneNumberController:contact2Controller
                            )
                          ),

                          _same_number ? Text('Désolé, les deux numéros doivent correspondre',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),textAlign: TextAlign.center,) : Container()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      AddContactsTransaction();
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      'Enregistrer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black54),
          title: const Text(
            'Selectionner un compte',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          //enregistrer
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => addNumber(context),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Enregistrer un compte',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<List<ContactTransaction>>(
              future: futureAllContactTransaction,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i) {
                        DateTime date = DateTime.parse(snapshot.data![i].created_at!);
                        var formatter = new DateFormat('EEE d MMM y ', 'fr_FR');
                        formatedDate = formatter.format(date);
                        return  Column(
                          children: [
                            SizedBox(height: 20,),
                            kOperateurNumero(
                              context,
                                snapshot.data![i].operateur == 'Orange' ? 'assets/images/Orange.png' :  snapshot.data![i].operateur == 'Wave' ? 'assets/images/wave.png': snapshot.data![i].operateur == 'MTN' ? 'assets/images/mtn.png': snapshot.data![i].operateur == 'MOOV' ? 'assets/images/moov.png':'',
                              '${snapshot.data![i].operateur}',
                              '${snapshot.data![i].numero}'
                            ),
                            /*kOperateurNumero(
                              context,
                              'assets/images/wave.png',
                              'Wave',
                              '08 18 39 10 11',
                            ),
                            kOperateurNumero(
                              context,
                              'assets/images/moov.png',
                              'MOOV',
                              '08 18 39 10 11',
                            ),
                            kOperateurNumero(
                              context,
                              'assets/images/mtn.png',
                              'MTN',
                              '05 18 09 10 11',
                            ),*/
                          ],
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

InkWell kOperateurNumero(
    BuildContext context, String image, String operateur, String numero) =>
    InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClickNumeroRetraitScreen(
            image: image,
            operateur: operateur,
            numero: numero,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade100,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  // image: DecorationImage(image: AssetImage('asset'))
                  borderRadius: BorderRadius.circular(32),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      operateur,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      numero,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

void showAlertDialogConnexion(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(color: blue,),
        Container(margin: EdgeInsets.only(left: 5),child:Text("Réquette en cours", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}