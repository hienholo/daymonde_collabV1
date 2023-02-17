import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:daymonde_collaboration/models/apiReponse.dart';
import 'package:daymonde_collaboration/const/contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

var StatusCode = 0;

////////////////////// login auth ////////////////
Future<ApiResponse> AddFournisseurRequest (
    String name,
    String prenom,
    String contact,
    String ville,
    String profession,
    String email,
    String password,
    String nom_etablissement,
    String localisation,
    String quartier_etablissement,
    String registre_recto,
    String registre_verso,
    String siege_photo1,
    String siege_photo2,
    String siege_photo3,
    String siege_photo4,
    ) async {
  ApiResponse apiResponse = ApiResponse();
  SharedPreferences pre = await SharedPreferences.getInstance();
  int id_recruteur_user = pre.getInt('userId') ?? 0;
  try{
    var headers = {
      'id_recruteur_user': ''
    };
    var request = http.MultipartRequest('POST', Uri.parse('${addFournisseur}'));
    request.fields.addAll({
      'id_recruteur_user':'${id_recruteur_user}',
      'name':name,
      'prenom':prenom,
      'contact':contact,
      'pays':"🇨🇮    Cote D'Ivoire (Ivory Coast)",
      'ville':ville,
      'profession':profession,
      'email':email,
      'password':password,
      'nom_etablissement':nom_etablissement,
      'id_ville':ville,
      'localisation':localisation,
      'quartier_etablissement':quartier_etablissement,
      'registre_recto':registre_recto,
      'registre_verso':registre_verso,
      'siege_photo1':siege_photo1,
      'siege_photo2':siege_photo2,
      'siege_photo3':siege_photo3,
      'siege_photo4':siege_photo4,
      'type_prod':'type_prod',
    });
    request.files.add(await http.MultipartFile.fromPath('registre_recto', registre_recto));
    request.files.add(await http.MultipartFile.fromPath('registre_verso', registre_verso));
    request.files.add(await http.MultipartFile.fromPath('siege_photo1', siege_photo1));
    request.files.add(await http.MultipartFile.fromPath('siege_photo2', siege_photo2));
    request.files.add(await http.MultipartFile.fromPath('siege_photo3',siege_photo3));
    request.files.add(await http.MultipartFile.fromPath('siege_photo4', siege_photo4));
    request.headers.addAll(headers);
    var response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      StatusCode = json.decode(result)['code'];
      StatusCode = json.decode(result)['code'];
      if(StatusCode == 303){
        apiResponse.error = json.decode(result)['message'];
      }
    }
    else {
      print(response.reasonPhrase);
      apiResponse.error = serverError;
    }
  }
  catch(e){
    print('error: ${e}');
    apiResponse.error = serverError;
  }
  return apiResponse;
}


Future<ApiResponse> FournisseurAddRequest (
    String name,
    String prenom,
    String contact,
    String photo,
    String ville,
    String profession,
    String email,
    String password,
    String nom_etablissement,
    String localisation,
    String quartier_etablissement,
    ) async {
  print(photo);
  ApiResponse apiResponse = ApiResponse();
  SharedPreferences pre = await SharedPreferences.getInstance();
  try{
    var headers = {
      'id_recruteur_user': ''
    };
    var request = http.MultipartRequest('POST', Uri.parse('${addFournisseur}'));
    request.fields.addAll({
      'name':name,
      'prenom':prenom,
      'contact':contact,
      'pays':"🇨🇮    Cote D'Ivoire (Ivory Coast)",
      'ville':ville,
      'profession':profession,
      'email':email,
      'password':password,
      'nom_etablissement':nom_etablissement,
      'localisation':localisation,
      'quartier_etablissement':quartier_etablissement,
      'type_prod':'type_prod',
    });
    photo != null ? request.files.add(await http.MultipartFile.fromPath('photo', photo)) : request.files.add(await http.MultipartFile.fromPath('photo', 'avatart.jpg'));
    request.headers.addAll(headers);
    var response = await request.send();
    print(response.toString());
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      StatusCode = json.decode(result)['code'];
      StatusCode = json.decode(result)['code'];
      if(StatusCode == 303){
        apiResponse.error = json.decode(result)['message'];
      }
    }
    else {
      print(response.reasonPhrase);
      apiResponse.error = serverError;
    }
  }
  catch(e){
    print('error: ${e}');
    apiResponse.error = serverError;
  }
  return apiResponse;
}



Future<ApiResponse> AddProduitsFournisseur (
    String nom,
    String description,
    String sous_categorie_id,
    String stock,
    String etat_id,
    String prix_vente,
    String prix_fournisseur,
    String ville_id,
    String prix_grossiste_unitaire,
    String photo1,
    String photo2,
    String photo3,
    String photo4,
    String photo5,
    String photo6,
    String photo7,
    String photo8,
    ) async {
  ApiResponse apiResponse = ApiResponse();
  SharedPreferences pre = await SharedPreferences.getInstance();
  int id_recruteur_user = pre.getInt('userId') ?? 0;
  try{
    var request = http.MultipartRequest('POST', Uri.parse('${addFournisseurProducts}'));
    request.fields.addAll({
      'fournisseur_id': '${id_recruteur_user}',
      'nom': '${nom}',
      'description': '${description}',
      'sous_categorie_id': '${sous_categorie_id}',
      'stock': '${stock}',
      'etat_id': '${etat_id}',
      'ville_id': '${ville_id}',
      'prix_vente': '${prix_vente}',
      'prix_fournisseur': '${prix_fournisseur}',
      'prix_grossiste_unitaire': '${prix_grossiste_unitaire}'
    });
    request.files.add(await http.MultipartFile.fromPath('photo1', '${photo1}'));
    request.files.add(await http.MultipartFile.fromPath('photo2', '${photo2}'));
    request.files.add(await http.MultipartFile.fromPath('photo3', '${photo3}'));
    request.files.add(await http.MultipartFile.fromPath('photo4', '${photo4}'));
    request.files.add(await http.MultipartFile.fromPath('photo5', '${photo5}'));
    request.files.add(await http.MultipartFile.fromPath('photo6', '${photo6}'));
    request.files.add(await http.MultipartFile.fromPath('photo7', '${photo7}'));
    request.files.add(await http.MultipartFile.fromPath('photo8', '${photo8}'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      StatusCode = json.decode(result)['code'];
      StatusCode = json.decode(result)['code'];
      if(StatusCode == 303){
        apiResponse.error = json.decode(result)['message'];
      }
      if(StatusCode == 404){
        apiResponse.error = json.decode(result)['message'];
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }
  catch(e){
    print('error: ${e}');
    apiResponse.error = serverError;
  }
  return apiResponse;
}


