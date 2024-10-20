import 'dart:convert';
import 'dart:io';

import 'dart:developer';

import 'package:jwellery_app/app/model/auth_response.dart';
import 'package:http/http.dart' as http;

class AuthApiProvider {

  Future<AuthResponse?> signUpApi(String name, String firmName,String mobileNo,String password) async {
       final Map<String, dynamic> mockRequestBody = {
      "name": name,
      "firmName": firmName,
      "mobileNo": mobileNo,
      "password": password,
    };
        log('Mock request body: ${json.encode(mockRequestBody)}', name: 'Mock Request');

    try{
       const  String response = '''{
    "message": "Logged in!",
    "data": {
        "_id": "66ffb65b53338fb408782b96",
        "authType": "Bearer",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZmZiNjViNTMzMzhmYjQwODc4MmI5NiIsIm5hbWUiOiJkZWVwYWtqaGEiLCJlbWFpbCI6ImRlZXBha2poYTIwMEBnbWFpbC5jb20iLCJpYXQiOjE3Mjk0MzI0OTgsImV4cCI6MTczNzIwODQ5OH0.4QgX8XrQz6CmKBPhCvWDhBYTIyIIULG_HOAsG_l6ndc",
        "name": "deepakjha"
    },
    "code": 200,
    "success": true
}''';

// final response = await http.post(Uri.parse(''),
// headers: {
//   'ContentType': 'application/json',
// },
// body: json.encode(mockRequestBody),
// );


final Map<String,dynamic> data = json.decode(response);

log(data.toString(),name: 'signUp Response Api');

final AuthResponse authResponse = AuthResponse.fromJson(data);


return authResponse;
 
    } on SocketException catch(e){

    log(e.toString(),name: 'error  signUp Response');

    }
    return null;
  }


  Future<AuthResponse?> loginApi(String mobileNo,String password) async {
       final Map<String, dynamic> mockRequestBody = {
   
      "mobileNo": mobileNo,
      "password": password,
    };
        log('Mock request body: ${json.encode(mockRequestBody)}', name: 'Mock Request');

    try{
       const  String response = '''{
    "message": "Logged in!",
    "data": {
        "_id": "66ffb65b53338fb408782b96",
        "authType": "Bearer",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZmZiNjViNTMzMzhmYjQwODc4MmI5NiIsIm5hbWUiOiJkZWVwYWtqaGEiLCJlbWFpbCI6ImRlZXBha2poYTIwMEBnbWFpbC5jb20iLCJpYXQiOjE3Mjk0MzI0OTgsImV4cCI6MTczNzIwODQ5OH0.4QgX8XrQz6CmKBPhCvWDhBYTIyIIULG_HOAsG_l6ndc",
        "name": "deepakjha"
    },
    "code": 200,
    "success": true
}''';

// final response = await http.post(Uri.parse(''),
// headers: {
//   'ContentType': 'application/json',
// },
// body: json.encode(mockRequestBody),
// );

final Map<String,dynamic> data = json.decode(response);

log(data.toString(),name: 'logIn Response Api');

final AuthResponse authResponse = AuthResponse.fromJson(data);


return authResponse;
 
    } on SocketException catch(e){

    log(e.toString(),name: 'error  logIn Response');

    }
    return null;
  }
}
