import 'package:daymonde_collaboration/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:http/http.dart' as http;
import 'models/apiReponse.dart';
import 'dart:convert';
Future<ApiResponse> Register (String email,password,nom,contact,pays,ville,code) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
      Uri.parse('$baseURL/register'),
      headers: {'Accept': 'application/json'},
      body: {'email': email, 'password': password,'code':code,'pays':pays,'contact':contact,'nom':nom,'ville':ville},
    );

    switch(response.statusCode){
      case 200:
        apiResponse.result=response.body;
        if(apiResponse.result!='ok'){
          apiResponse.error=response.body;

        }
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
      print(response.statusCode);
        apiResponse.error = "some  thing WentWrong";
        break;
    }
  }
  catch(e){
  onSocketException(){
  print('Erreur de connection');
  }

  }
  return apiResponse;
}


Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}


Future<bool> get_Session() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getBool('user_Session') ?? false;
}

Future<String> get_User_name() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('user_name') ?? '';
}

Future<String> get_User_photo() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('user_photo') ?? '';
}
Future<String> get_User_email() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('user_email') ?? '';
}
// logout
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool ok =    await pref.remove('userId') && await pref.remove('user_Session') ;
  return ok;
}

