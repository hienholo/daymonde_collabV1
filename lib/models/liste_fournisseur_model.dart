import 'dart:convert';

List ModelAllFournisseurFromJson(String str) =>
    List<FournisseurModel>.from(json.decode(str).map((x) => FournisseurModel.fromMap(x)));

class FournisseurModel {
  String ? USER_ID;
  String? FOURNISSEUR_ID;
  String ? name;
  String ? prenom;
  String ? contact;
  String? pays;
  String? ville;
  String? photo;
  String? profession;
  String? email;
  String? nom_etablissement;
  String? status_etablissement;
  String? localisation;
  String? quartier_etablissement;
  String? type_prod;
  String? registre_recto;
  String? registre_verso;
  String? siege_photo1;
  String? siege_photo2;
  String? siege_photo3;
  String? siege_photo4;
  String? nbre_prod_add;
  String? collaboration_approuve;
  String? demande_rupture;
  String? lien_rupture;
  String? date_add_recru_product;

  FournisseurModel({
    this.USER_ID,
    this.FOURNISSEUR_ID,
    this.name,
    this.prenom,
    this.contact,
    this.pays,
    this.ville,
    this.photo,
    this.profession,
    this.email,
    this.nom_etablissement,
    this.status_etablissement,
    this.localisation,
    this.quartier_etablissement,
    this.type_prod,
    this.registre_recto,
    this.registre_verso,
    this.siege_photo1,
    this.siege_photo2,
    this.siege_photo3,
    this.siege_photo4,
    this.nbre_prod_add,
    this.collaboration_approuve,
    this.demande_rupture,
    this.lien_rupture,
    this.date_add_recru_product,

  });

  factory FournisseurModel.fromMap(Map<String, dynamic> json) => FournisseurModel(
      USER_ID: json['USER_ID'],
      FOURNISSEUR_ID:json['FOURNISSEUR_ID'],
      name:json['name'],
      prenom:json['prenom'],
      contact:json['contact'],
      pays:json['pays'],
      ville:json['ville'],
      photo:json['photo'],
      profession:json['profession'],
      email:json['email'],
      nom_etablissement:json['nom_etablissement'],
      status_etablissement:json['status_etablissement'],
      localisation:json['localisation'],
      quartier_etablissement:json['quartier_etablissement'],
      type_prod:json['type_prod'],
      registre_recto:json['registre_recto'],
      registre_verso:json['registre_verso'],
      siege_photo1:json['siege_photo1'],
      siege_photo2:json['siege_photo2'],
      siege_photo3:json['siege_photo3'],
      siege_photo4:json['siege_photo4'],
      nbre_prod_add:json['nbre_prod_add'],
      collaboration_approuve:json['collaboration_approuve'],
      demande_rupture:json['demande_rupture'],
      lien_rupture:json['lien_rupture'],
     date_add_recru_product:json['date_add_recru_product'],
  );
}

