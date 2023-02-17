import 'dart:convert';

List ModelSousCategoriesFromJson(String str) =>
    List<ModelSousCategories>.from(json.decode(str).map((x) => ModelSousCategories.fromMap(x)));
class ModelSousCategories {
  String ? id;
  String? categorie_id;
  String ? nom;

  ModelSousCategories({
    this.id,
    this.categorie_id,
    this.nom,
  });
  factory ModelSousCategories.fromMap(Map<String, dynamic> json) => ModelSousCategories(
    id: json['id'],
    categorie_id:json['categorie_id'],
    nom:json['nom'],

  );
}


