import 'package:daymonde_collaboration/const/contants.dart';
import 'package:daymonde_collaboration/models/user_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

var StatusCode = 0;

////////////////////// login auth ////////////////
Future<ApiResponse> Login (String contact,String password) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(Uri.parse(loginURL),
      headers: {'Accept': 'application/json'},
      body: {
        'contact':contact,
        'password': password
      },
    );
    switch(response.statusCode){
      case 200:
        var resultats = jsonDecode(response.body);
         SharedPreferences prefs = await SharedPreferences.getInstance();
         prefs.setInt('userId', resultats['user']['id']);
         prefs.setString('token', resultats['token']);
         prefs.setString('role_as', resultats['user']['role_as']);
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

///////////////////// login auth ////////////////
Future<ApiResponse> Register (
    String name,
    String prenom,
    String email,
    String contact,
    String pays,
    String ville,
    String profession,
    String password,
    ) async {
  ApiResponse apiResponse = ApiResponse();
  print(pays);
  try{
    final response = await http.post(Uri.parse(registerURL),
      headers: {'Accept': 'application/json'},
      body: {
        'name':name,
        'prenom':prenom,
        'email':email,
        'contact':contact,
        'pays':pays,
        'ville':ville,
        'profession':profession,
        'password': password
      },
    );
    switch(response.statusCode){
      case 200:
        var data = jsonDecode(response.body);
        print(data);
        StatusCode = data['code'];
        if(StatusCode == 200){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('VERIF_EMAIL', email);
          prefs.setString('VERIF_STATUS', 'VERIF_STATUS');
        }else if(StatusCode == 303){
          apiResponse.error = 'Ce compte existe déjà, veuillez vérifier votre adresse email ou numéro de téléphone';
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
    apiResponse.error = serverError;
  }
  return apiResponse;
}

//////////////////////// confirmation de compte //////////////
Future<ApiResponse> daymondOptForm (String code_phone_verified) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(Uri.parse(VerifyCompteURL),
      headers: {'Accept': 'application/json'},
      body: {
        'code_phone_verified':code_phone_verified,
      },
    );
    switch(response.statusCode){
      case 200:
        var data = jsonDecode(response.body);
        StatusCode = data['code'];
        if(StatusCode == 300){
          apiResponse.error = 'auccun compte correspond a ce code';
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
//////////////////// get user details //////////////
Future<List <GetAuhtInfo>?> getUserDetail () async {
  ApiResponse apiResponse = ApiResponse();
  try{
    int user_id = await getUserId() ;
    final response = await http.get(
      Uri.parse('${userDetailURL}?id_user=${user_id}'),
      headers: {'Accept': 'application/json'},);
    if (response.statusCode == 200) {
      StatusCode = 200;
      var jsonResponse = json.decode(response.body);
      //print(jsonResponse['recruteur_infos']);
      var data = jsonResponse['recruteur_infos'].cast<Map<String, dynamic>>();
      return data.map<GetAuhtInfo>((json) => GetAuhtInfo.fromMap(json)).toList();
    }
  }
  catch(e){
    apiResponse.error = serverError;
  }
}
//////////////////// get user token ///////////
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

Future<String> getRole() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('role_as') ?? '';
}
//////////////////// get user id ///////////
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

///////////////// get users VERIF_STATUS /////////////////
Future<String> getVerifyStatus() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('VERIF_STATUS') ?? '';
}

///////////////// user logout /////////////////
Future<bool> Logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return  await pref.remove('token');
}