import 'package:intl/intl.dart';

////////////// API URL //////////
//const baseURL ='https://mes-applications.000webhostapp.com/api';
const baseURL ='https://daymond.titho-express.ci/api/v1';
const FILE_PRODUIT_PATH = "https://daymond.titho-express.ci/public/images/produits";
const FILE_FOURNISSEUR_PATH = "https://daymond.titho-express.ci/public/images/assets_fournisseur";
const FILE_PATH_USER = "https://daymond.titho-express.ci/public/images/users";
const loginURL = '${baseURL}/recruteur/login';
const registerURL = '${baseURL}/recruteur/register';
const userDetailURL = '${baseURL}/recruteur/show_recruteur';
const fournisseursDetails = '${baseURL}/fournisseur/show_fournisseur';
const VerifyCompteURL = '${baseURL}/daymond_api_opt_form';
const getAllFournisseur = '${baseURL}/recruteur/get_all_fournisseur';
const getCommandeRecruteur = '${baseURL}/commande/commandes_recruteur_vendeur';
const getNiveauURL = '${baseURL}/recruteur/vendeur_niveaux';
const getBalanceURL = '${baseURL}/recruteur/somme_montant_retire';
const getAllRetraits = '${baseURL}/recruteur/get_transaction_by_user';
const demandeRetraits = '${baseURL}/recruteur/set_transaction_retrait';
const addContactTransaction = '${baseURL}/recruteur/AddContactTransaction';
const getAllContactTransaction = '${baseURL}/recruteur/getAllContactTransactions';
const addFournisseur = '${baseURL}/recruteur/add_fournisseur';
const getProductFournisseurs = '${baseURL}/recruteur/show_product_recteur_fournisseur';
const getProductFournisseurs_by_id = '${baseURL}/recruteur/show_product_recteur_fournisseur_by_id';
const getVendeursByNiveauxURL = '${baseURL}/recruteur/getVendeur_by_niveaux';
const getAllVendeur = '${baseURL}/recruteur/get_all_vendeur';
const addVendeur = '${baseURL}/recruteur/recruteur_add_seller';
const CategoriesProducts = '${baseURL}/collaboration/getAllCategories';
const SousCategoriesProducts = '${baseURL}/collaboration/CgetSousAllCategories';
const getAllProductFournisseur = '${baseURL}/fournisseurs/all_product_fournisseur';
const addFournisseurProducts = '${baseURL}/fournisseurs/fournisseur_add_products_unitaire';
const getAllCities = '${baseURL}/collaboration/CGettAllCities';

//////////////// CONST ERROR /////////
const serverError = "Il y'a eu une erreur du server";
const unautorized = "Désolé vous n'etes pas autorisés";
const sommeThingWentWrong = "Quelque chose s'est produite, reéssayez encore";

FormatDate(String Date){
  DateTime date = DateTime.parse(Date);
  var formatter = new DateFormat('EEE d MMM y HH:mm ', 'fr_FR');
  var formatedDate = formatter.format(date);
  return formatedDate;
}
