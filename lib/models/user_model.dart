import 'dart:convert';

class User {
  final int id;
  final String name;
  final String profilImage;
  final String date;
  final String montant;
  final String moyenPaiemet;
  final String numero;
  final String numeroWhatsApp;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.profilImage,
    required this.date,
    required this.montant,
    required this.numero,
    required this.numeroWhatsApp,
    required this.moyenPaiemet,
    required this.token,
  });

  ////////////////// function to convert json data model ///////////
factory User.fromJson(Map<String , dynamic> json){
  return User(
    id: json['user']['id'],
    name: json['user']['id'],
    profilImage: json['user']['id'],
    date: json['user']['id'],
    montant: json['user']['id'],
    numero: json['user']['id'],
    numeroWhatsApp: json['user']['id'],
    moyenPaiemet: json['user']['id'],
    token: json['user']['token'],
  );

}


}



List ModelAllFournisseurFromJson(String str) =>
    List<GetAuhtInfo>.from(json.decode(str).map((x) => GetAuhtInfo.fromMap(x)));

class GetAuhtInfo {
  int? id;
  String? name;
  String? prenom;
  String? contact;
  String? pays;
  String? ville;
  String? role_as;
  String? photo;
  String? profession;
  String? email;
  String? created_at;

  GetAuhtInfo({
    this.id,
    this.name,
    this.prenom,
    this.contact,
    this.pays,
    this.ville,
    this.role_as,
    this.photo,
    this.profession,
    this.email,
    this.created_at,
  });

  // function to convert json data to user model
  factory GetAuhtInfo.fromMap(Map<String, dynamic> json) => GetAuhtInfo(
    id: json['id'],
    name: json['name'],
    prenom: json['prenom'],
    contact: json['contact'],
    pays: json['pays'],
    ville: json['ville'],
    role_as: json['role_as'],
    photo: json['photo'],
    profession: json['profession'],
    email: json['email'],
    created_at: json['created_at'],
  );


}

