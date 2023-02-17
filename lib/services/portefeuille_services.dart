import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

var StatusCode = 0;

////////////////////// login auth ////////////////
Future<ApiResponse> DemandeRetraits (
    String montant_retrait,
    String numero_retrait,
    String operateur_retrait,
    ) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    SharedPreferences pre = await SharedPreferences.getInstance();
    int user_id = pre.getInt('userId') ?? 0;
    print(user_id);
    print(demandeRetraits);
    String type = 'RETRAIT';
    final response = await http.post(Uri.parse(demandeRetraits),
      headers: {'Accept': 'application/json'},
      body: {
        'type':type,
        'user_id':'${user_id}',
        'montant_retrait': montant_retrait,
        'numero_retrait': numero_retrait,
        'operateur_retrait': operateur_retrait,
      },
    );
    switch(response.statusCode){
      case 200:
        var resultats = jsonDecode(response.body);
        print(resultats);
        StatusCode = resultats['code'];
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

////////////////////// login auth ////////////////
Future<ApiResponse> AddContactransactionRequest (
    String numero,
    String operateur,
    ) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    SharedPreferences pre = await SharedPreferences.getInstance();
    int user_id = pre.getInt('userId') ?? 0;
    print(user_id);
    print(addContactTransaction);
    final response = await http.post(Uri.parse(addContactTransaction),
      headers: {'Accept': 'application/json'},
      body: {
        'user_id':'${user_id}',
        'numero': numero,
        'operateur': operateur,
      },
    );
    switch(response.statusCode){
      case 200:
        var resultats = jsonDecode(response.body);
        print(resultats);
        StatusCode = resultats['code'];
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