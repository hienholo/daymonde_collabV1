import 'dart:convert';

List ModelGetBalanceFromJson(String str) =>
    List<ModelGetBalance>.from(json.decode(str).map((x) => ModelGetBalance.fromMap(x)));
class ModelGetBalance {
  String ? id;
  String? somme;
  String ? solde_total_daymond;

  ModelGetBalance({
    this.id,
    this.somme,
    this.solde_total_daymond,
  });
  factory ModelGetBalance.fromMap(Map<String, dynamic> json) => ModelGetBalance(
    id: json['id'],
    somme:json['somme'],
    solde_total_daymond:json['solde_total_daymond'],

  );
}

//////////////////////////// get transaction by user ////////////////
List ModelTransactionUsersFromJson(String str) =>
    List<ModelGetBalance>.from(json.decode(str).map((x) => ModelGetBalance.fromMap(x)));
class ModelTransactionUsers {
  String ? ID_TRANSACTION;
  String? type;
  String? somme;
  String ? numero_retrait;
  String ? reference_retrait;
  String ? operateur_retrait;
  String ? status_retrait;
  String ? solde_total_daymond;

  ModelTransactionUsers({
    this.ID_TRANSACTION,
    this.type,
    this.somme,
    this.numero_retrait,
    this.reference_retrait,
    this.operateur_retrait,
    this.status_retrait,
    this.solde_total_daymond,

  });
  factory ModelTransactionUsers.fromMap(Map<String, dynamic> json) => ModelTransactionUsers(
    ID_TRANSACTION: json['ID_TRANSACTION'],
    type:json['type'],
    somme:json['somme'],
    numero_retrait:json['numero_retrait'],
    reference_retrait:json['reference_retrait'],
    operateur_retrait:json['operateur_retrait'],
    status_retrait:json['status_retrait'],
    solde_total_daymond:json['solde_total_daymond'],

  );
}

//////////////////////////// somme argent retiré ////////////////
List ModelSommeRetraitFromJson(String str) =>
    List<ModelSommeRetrait>.from(json.decode(str).map((x) => ModelSommeRetrait.fromMap(x)));
class ModelSommeRetrait {
  String? solde_retire;

  ModelSommeRetrait({
    this.solde_retire,

  });
  factory ModelSommeRetrait.fromMap(Map<String, dynamic> json) => ModelSommeRetrait(
    solde_retire: json['solde_retire'],

  );
}


//////////////////////////// somme argent retiré ////////////////
List ModelContactTransactionFromJson(String str) =>
    List<ModelSommeRetrait>.from(json.decode(str).map((x) => ModelSommeRetrait.fromMap(x)));
class ContactTransaction {
  String? id;
  String? numero;
  String? operateur;
  String? created_at;

  ContactTransaction({
    this.id,
    this.numero,
    this.operateur,
    this.created_at,

  });
  factory ContactTransaction.fromMap(Map<String, dynamic> json) => ContactTransaction(
    id: json['id'],
    numero: json['numero'],
    operateur: json['operateur'],
    created_at: json['created_at'],

  );
}

