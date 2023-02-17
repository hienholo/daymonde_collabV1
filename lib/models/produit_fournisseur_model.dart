import 'dart:convert';


//////////////////////////// get transaction by user ////////////////
List ModelProduitsFournisseurFromJson(String str) =>
    List<ModelProduitsFournisseur>.from(json.decode(str).map((x) => ModelProduitsFournisseur.fromMap(x)));
class ModelProduitsFournisseur {
  String ? ID_PRODUIT;
  String ? fournisseur_id;
  String ? id_recruteur;
  String? nom_produit;
  String? alias;
  String ? soustitre;
  String ? description;
  String ? ville_id;
  String ? etat_id;
  String ? etoile;
  String ? troc;
  String ? popular;
  String ? stock;
  String ? indisponible;
  String ? invisible;
  String ? supprime;
  String ? rappel;
  String ? prix_fournisseur;
  String ? prix_reduit;
  String ? prix_grossiste_unitaire;
  String ? prix_vente_grossiste_A;
  String ? prix_vente_grossiste_B;
  String ? prix_vente;
  String ? commission;
  String ? prix_louer;
  String ? prix_livraison_ville;
  String ? prix_livraison_hors_ville;
  String ? nb_download;
  String ? nb_copy;
  String ? nb_vue;
  String ? lien;
  String ? prod_certifie;
  String ? nom_etablissement;
  String ? nom_ville;
  String ? status_etablissement;
  String ? localisation;
  String ? quartier_etablissement;
  String ? type_prod;
  String ? registre_recto;
  String ? registre_verso;
  String ? siege_photo1;
  String ? siege_photo2;
  String ? siege_photo3;
  String ? siege_photo4;
  String ? photo;
  String ? pays_id;
  String ? nom_categorie;
  String ? nom_sous_categorie;
  String ? name;
  String ? prenom;
  String ? nom_etat;
  String ? contact;
  String ? pays;
  String ? photo_produit_principal;

  ModelProduitsFournisseur({
    this.ID_PRODUIT,
    this.fournisseur_id,
    this.id_recruteur,
    this.nom_produit,
    this.alias,
    this.soustitre,
    this.description,
    this.ville_id,
    this.etat_id,
    this.etoile,
    this.troc,
    this.popular,
    this.stock,
    this.indisponible,
    this.invisible,
    this.supprime,
    this.rappel,
    this.prix_fournisseur,
    this.prix_reduit,
    this.prix_grossiste_unitaire,
    this.prix_vente_grossiste_A,
    this.prix_vente_grossiste_B,
    this.prix_vente,
    this.commission,
    this.prix_louer,
    this.prix_livraison_ville,
    this.prix_livraison_hors_ville,
    this.nb_download,
    this.nb_copy,
    this.nb_vue,
    this.lien,
    this.prod_certifie,
    this.nom_etablissement,
    this.nom_ville,
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
    this.photo,
    this.pays_id,
    this.nom_categorie,
    this.nom_sous_categorie,
    this.name,
    this.prenom,
    this.nom_etat,
    this.contact,
    this.pays,
    this.photo_produit_principal,
  });
  factory ModelProduitsFournisseur.fromMap(Map<String, dynamic> json) => ModelProduitsFournisseur(
    ID_PRODUIT:json['ID_PRODUIT'],
    fournisseur_id:json['fournisseur_id'],
    id_recruteur:json['id_recruteur'],
    nom_produit:json['nom_produit'],
    alias:json['alias'],
    soustitre:json['soustitre'],
    description:json['description'],
    ville_id:json['ville_id'],
    etat_id:json['etat_id'],
    etoile:json['etoile'],
    troc:json['troc'],
    popular:json['popular'],
    stock:json['stock'],
    indisponible:json['indisponible'],
    invisible:json['invisible'],
    supprime:json['supprime'],
    rappel:json['rappel'],
    prix_fournisseur:json['prix_fournisseur'],
    prix_grossiste_unitaire:json['prix_grossiste_unitaire'],
    prix_vente_grossiste_A:json['prix_vente_grossiste_A'],
    prix_vente_grossiste_B:json['prix_vente_grossiste_B'],
    prix_vente:json['prix_vente'],
    commission:json['commission'],
    prix_louer:json['prix_louer'],
    prix_livraison_ville:json['prix_livraison_ville'],
    prix_livraison_hors_ville:json['prix_livraison_hors_ville'],
    nb_download:json['nb_download'],
    nb_copy:json['nb_copy'],
    nb_vue:json['nb_vue'],
    lien:json['lien'],
    prod_certifie:json['prod_certifie'],
    nom_etablissement:json['nom_etablissement'],
    nom_ville:json['nom_ville'],
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
    photo:json['photo'],
    pays_id:json['pays_id'],
    nom_categorie:json['nom_categorie'],
    nom_sous_categorie:json['nom_sous_categorie'],
    name:json['name'],
    prenom:json['prenom'],
    nom_etat:json['nom_etat'],
    contact:json['contact'],
    pays:json['pays'],
    photo_produit_principal:json['photo_produit_principal'],
  );
}