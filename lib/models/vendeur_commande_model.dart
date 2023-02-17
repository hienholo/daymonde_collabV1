import 'dart:convert';

List ModelVendeurCommandeFromJson(String str) =>
    List<ModelCommandes>.from(json.decode(str).map((x) => ModelCommandes.fromMap(x)));

class ModelCommandes {
  String ? ID_COMMANDE;
  String? type;
  String ? date_livraison;
  String ? heure_livraison;
  String ? frais_livraison;
  String? lieu_livraison;
  String? qte;
  String? nom_produit;
  String? contact1;
  String? contact2;
  String? detail;
  String? prix_max;
  String? prix_proposition;
  String? prix_total;
  String? status;
  String? status_moi;
  String? motif_encours;
  String? motif_attente;
  String? motif_annule;
  String? motif_valide;
  String? name;
  String? prenom;
  String? contact;
  String? pays;
  String? ville;
  String? photo_produit_principal;
  String? prix_vente;
  String? soustitre;
  String? date_commande;

  ModelCommandes({
    this.ID_COMMANDE,
    this.type,
    this.date_livraison,
    this.heure_livraison,
    this.frais_livraison,
    this.lieu_livraison,
    this.qte,
    this.nom_produit,
    this.contact1,
    this.contact2,
    this.detail,
    this.prix_max,
    this.prix_proposition,
    this.prix_total,
    this.status,
    this.status_moi,
    this.motif_encours,
    this.motif_attente,
    this.motif_annule,
    this.motif_valide,
    this.name,
    this.prenom,
    this.contact,
    this.pays,
    this.ville,
    this.photo_produit_principal,
    this.prix_vente,
    this.soustitre,
    this.date_commande,
  });





  factory ModelCommandes.fromMap(Map<String, dynamic> json) => ModelCommandes(
    ID_COMMANDE: json['ID_COMMANDE'],
    type:json['type'],
    date_livraison:json['date_livraison'],
    heure_livraison:json['heure_livraison'],
    frais_livraison:json['frais_livraison'],
    lieu_livraison:json['lieu_livraison'],
    qte:json['qte'],
    nom_produit:json['nom_produit'],
    contact1:json['contact1'],
    contact2:json['contact2'],
    detail:json['detail'],
    prix_max:json['prix_max'],
    prix_proposition:json['prix_proposition'],
    prix_total:json['prix_total'],
    status:json['status'],
    status_moi:json['status_moi'],
    motif_encours:json['motif_encours'],
    motif_attente:json['motif_attente'],
    motif_annule:json['motif_annule'],
    motif_valide:json['motif_valide'],
    name:json['name'],
    prenom:json['prenom'],
    contact:json['contact'],
    pays:json['pays'],
    ville:json['ville'],
    photo_produit_principal:json['photo_produit_principal'],
    prix_vente:json['prix_vente'],
    soustitre:json['soustitre'],
    date_commande:json['date_commande'],
  );
}