//https://1630692530.myzencommerce.in
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

String url_reg = 'http://1630692530.myzencommerce.in/webapi/front/in/user/register/';
String url_logout = 'https://1630692530.myzencommerce.in/webapi/front/in/auth/logout/';
String url_login = 'https://1630692530.myzencommerce.in/webapi/front/in/auth/login/';
Future<dynamic> login(String email, String pass) async {
  String basicAuth ='Basic ' + base64Encode(utf8.encode('$email:$pass'));

  Response r = await http.post(url_login,
      headers: <String, String>{'authorization': basicAuth});
  print(r.statusCode);
  print(r.body);
  return r.body;
}

Future<dynamic> logout() async {

  Response r = await http.post(url_logout);
  print(r.statusCode);
  print(r.body);
  return r.body;
}

Future<dynamic> register(String email,String pass) async
{
  final body = {
    'mail': email,
    'password': pass,
    'group_id':0,
    'additional_1': 1,
    'active': 1,  //comment this if you don't want to make the user active immediately
    'verify_email': 1 // Make this 1, if you want to make user go through email verification
  };
  final jsonString = json.encode(body);
  Response r = await post(url_reg,
     headers: {"Content-Type": "application/json"},
    body: jsonString,
  );

  print(r.statusCode);// prints 200

  print(r.body);
  return r.body;
}
