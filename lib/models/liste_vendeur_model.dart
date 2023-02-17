import 'dart:convert';

List ModelVendeurFromJson(String str) =>
    List<ModelVendeur>.from(json.decode(str).map((x) => ModelVendeur.fromMap(x)));

class ModelVendeur {
  String ? USER_ID;
  String ? ID_VENDEUR;
  String ? name;
  String? prenom;
  String? contact;
  String? pays;
  String? ville;
  String? photo;
  String? role_as;
  String? profession;
  String? email;
  String? date_vendeur_add;
  String? niveaux_increment;
  String? niveaux_base;
  String? demande_rupture;
  String? lien_rupture;


  ModelVendeur({
    this.USER_ID,
    this.ID_VENDEUR,
    this.name,
    this.prenom,
    this.contact,
    this.pays,
    this.ville,
    this.photo,
    this.role_as,
    this.profession,
    this.email,
    this.demande_rupture,
    this.lien_rupture,
    this.niveaux_increment,
    this.niveaux_base,
    this.date_vendeur_add,


  });

  factory ModelVendeur.fromMap(Map<String, dynamic> json) => ModelVendeur(
    USER_ID: json['USER_ID'],
    ID_VENDEUR:json['ID_VENDEUR'],
    name:json['name'],
    prenom:json['prenom'],
    contact:json['contact'],
    pays:json['pays'],
    ville:json['ville'],
    photo:json['photo'],
    role_as:json['role_as'],
    profession:json['profession'],
    email:json['email'],
    demande_rupture:json['demande_rupture'],
    lien_rupture:json['lien_rupture'],
    niveaux_increment:json['niveaux_increment'],
    niveaux_base:json['niveaux_base'],
    date_vendeur_add:json['date_vendeur_add'],
  );
}
