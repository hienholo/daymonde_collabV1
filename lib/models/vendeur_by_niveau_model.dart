import 'dart:convert';

List ModelVendeurFromJson(String str) =>
    List<ModelVendeurByNiveaux>.from(json.decode(str).map((x) => ModelVendeurByNiveaux.fromMap(x)));

class ModelVendeurByNiveaux {
  String ? id_user;
  String? id_recruteur;
  String ? niveaux_increment;
  String ? niveaux_base;
  String? name;
  String? prenom;
  String? contact;
  String? pays;
  String? ville;
  String? photo;
  String? role_as;
  String? profession;
  String? email;
  String? vendeur_add;



  ModelVendeurByNiveaux({
    this.id_user,
    this.id_recruteur,
    this.niveaux_increment,
    this.niveaux_base,
    this.name,
    this.prenom,
    this.contact,
    this.pays,
    this.ville,
    this.photo,
    this.role_as,
    this.profession,
    this.email,
    this.vendeur_add,
  });

  factory ModelVendeurByNiveaux.fromMap(Map<String, dynamic> json) => ModelVendeurByNiveaux(
    id_user: json['id_user'],
    id_recruteur:json['id_recruteur'],
    niveaux_increment:json['niveaux_increment'],
    niveaux_base:json['niveaux_base'],
    name:json['name'],
    prenom:json['prenom'],
    contact:json['contact'],
    pays:json['pays'],
    ville:json['ville'],
    photo:json['photo'],
    role_as:json['role_as'],
    profession:json['profession'],
    email:json['email'],
    vendeur_add:json['vendeur_add'],
  );
}
