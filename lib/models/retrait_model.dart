import 'dart:convert';


//////////////////////////// get transaction by user ////////////////
List RetraitModelFromJson(String str) =>
    List<RetraitModel>.from(json.decode(str).map((x) => RetraitModel.fromMap(x)));
class RetraitModel {
  String ? ID_TRANSACTION;
  String? type;
  String? somme;
  String ? numero_retrait;
  String ? reference_retrait;
  String ? operateur_retrait;
  String ? status_retrait;
  String ? solde_total_daymond;
  String ? DATE_TRANSACTION;
  String ? montant_retrait;

  RetraitModel({
    this.ID_TRANSACTION,
    this.type,
    this.somme,
    this.numero_retrait,
    this.reference_retrait,
    this.operateur_retrait,
    this.status_retrait,
    this.solde_total_daymond,
    this.DATE_TRANSACTION,
    this.montant_retrait,


  });
  factory RetraitModel.fromMap(Map<String, dynamic> json) => RetraitModel(
    ID_TRANSACTION: json['ID_TRANSACTION'],
    type:json['type'],
    somme:json['somme'],
    numero_retrait:json['numero_retrait'],
    reference_retrait:json['reference_retrait'],
    operateur_retrait:json['operateur_retrait'],
    status_retrait:json['status_retrait'],
    solde_total_daymond:json['solde_total_daymond'],
    DATE_TRANSACTION:json['DATE_TRANSACTION'],
    montant_retrait:json['montant_retrait'],

  );
}