import 'dart:convert';
import 'dart:io';

/////// GET BASE64 ENCODE IMAGE ////////
String ? getStringImage(File? file){
  if(file == null ) return null;
  return base64Encode(file.readAsBytesSync());
}