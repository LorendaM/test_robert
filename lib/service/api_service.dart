// ignore_for_file: unused_import, prefer_const_constructors, avoid_print, unused_local_variable, non_constant_identifier_names, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings
import "dart:convert";
import 'dart:io';

import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:http/http.dart" as http;

import "../app.dart";
import "../models/user_model.dart";

class RequestApiService {

  RequestApiService() {
    /*   BaseOptions options = BaseOptions(
      baseUrl: "http://145.239.198.239:8040",
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 5000),
    );
    dio = Dio(options); */
  }
  static String baseUrl =" http://127.0.0.1:8000/";
  static String apiUrl = "${baseUrl}api/";

  static Future<dynamic> signin(String username,String password) async {
    try {
      Map data = {
        "username": username,
        "password": password,
      };
      final response = await http.post(Uri.parse("${apiUrl}login"), body: data);
      var jsondata = json.decode(response.body);
      print(response.body);

      if (jsondata['error']) {
        App.getSnackbarDanger("Authentification", jsondata['message']);
        return false;
      }
      App.snackbar(Get.context!, jsondata['message']);
      return UserModel.fromJson(jsondata['data']);
    } catch (e) {
      print(e);
      return (false);
    }
  }


  static Future<bool> register(String username, String password, String password_confirmation) async {
    try {
      Map data = {
        "password": password,
        "password_confirmation": password_confirmation,
        "username": username,
      };
      print(data);

      final response = await http.post(Uri.parse("${apiUrl}register"), body: data);
      var jsondata = json.decode(response.body);

      if (jsondata['error']) {
        App.getSnackbarDanger("Validation du numéro de téléphone", jsondata['message']);
        return false;
      }
      App.snackbar(Get.context!, jsondata['message']);
      return true;
    } catch (e) {
      print(e);
      return (false);
    }
  }

  static Future<dynamic> editProfile({required String username,required String password,}) async {
    try {
      Map data = {
        "username": username,
        "password": password,
      };
      final response = await http.post(Uri.parse("${apiUrl}update"),
          body: json.encode(data));
      var jsondata = json.decode(response.body);
      if ((jsondata['error'] is bool && jsondata['error'] == true) || jsondata['error'] == "true") {
        App.getSnackbarSuccess("Modification du profil", jsondata['message']);

      }
      App.snackbar(Get.context!, jsondata['message']);
      return true;
    } catch (e) {
      print(e);
      return (false);
    }

  }


}

RequestApiService get apiconsumer => RequestApiService();
