import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

var StatusCode = 0;

////////////////////// login auth ////////////////
Future<ApiResponse> AddSellersRequest (
    String name,
    String prenom,
    String contact,
    String contact_whatsap,
    String ville,
    String profession,
    String email,
    String password,
    ) async {


  ApiResponse apiResponse = ApiResponse();
  try{
    SharedPreferences pre = await SharedPreferences.getInstance();
    int id_recruteur_user = pre.getInt('userId') ?? 0;
    final response = await http.post(Uri.parse(addVendeur),
      headers: {'Accept': 'application/json'},
      body: {
        'id_recruteur_user':'${id_recruteur_user}',
        'name':name,
        'prenom':prenom,
        'contact':contact,
        'contact_whatsap':contact_whatsap,
        'pays':"Cote d'Ivoire",
        'ville':ville,
        'profession':profession,
        'email':email,
        'password':password,
      },
    );
    print(jsonDecode(response.body));
    switch(response.statusCode){
      case 200:
        var resultats = jsonDecode(response.body);
        StatusCode = resultats['code'];
        if(StatusCode == 303){
          apiResponse.error = 'Désolé ce compte existe déjà';
        }
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)];//[0];
        break;
      case 403:
        apiResponse.error = response.body;
        break;
      default:
        apiResponse.error = sommeThingWentWrong;
        break;
    }
  }
  catch(e){
    print('error:::: ${e}');
    apiResponse.error = serverError;
  }
  return apiResponse;
}