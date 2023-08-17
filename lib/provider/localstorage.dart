// ignore_for_file: avoid_print, unused_import, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class LocalStorage {
  static late SharedPreferences localstorage;
  static late BuildContext context;

  LocalStorage(context) {
    init();
  }

  static init() async {
    // Initialisation du service de récupération locale
    localstorage = await SharedPreferences.getInstance();

    return true;
  }

  static bool get logged => localstorage.getBool("logged") ?? false;

  static set logged(bool value) => localstorage.setBool("logged", value);
  static UserModel? user;

  static saveLoggerInformations(UserModel logger) async {
    String toString = json.encode(logger);
    return await localstorage.setString("userInApp", toString);
  }

  static setUserLogged(UserModel logger) async {
    logged = true;
    user = logger;
    await saveLoggerInformations(logger);
    return await init();
  }

  static getLoggedUser() async {
    return localstorage.getString("userInApp") ?? "[]";
  }

  static Future<bool> isAuthenticated() async {
    try {
      if (LocalStorage.logged) {
        user = UserModel.fromJson(json.decode(localstorage.getString("userInApp") ?? "[]"));
        LocalStorage.logout();
      }
      return false;
    } catch (e) {
      /* 
      await Future.delayed(Duration(seconds: 5));
      print('MOISE*****************************'); */
      return false;
    }
  }

  static logout() async {
    if (LocalStorage.logged) {
      localstorage.remove("userInApp");
      localstorage.remove("logged");
      localstorage.remove("gameRounds");
      localstorage.remove("convertGifts");
      localstorage.remove("favorites");
      return await init();
    }
  }

}
