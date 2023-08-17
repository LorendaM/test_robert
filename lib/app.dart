import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App{
  App(){

  }
  static snackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message.toString()),
      duration: const Duration(seconds: 5),
      showCloseIcon: true,
    ));
  }
  static getSnackbarDanger(String title, String text, [icon]) {
    Get.closeCurrentSnackbar();
    Get.closeAllSnackbars();
    return Get.snackbar(title, text,
        icon: Icon(icon ?? Icons.error, color: Colors.white),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 6),
        animationDuration: const Duration(milliseconds: 300),
        snackStyle: SnackStyle.GROUNDED,
        isDismissible: true,
        colorText: Colors.white,
        maxWidth: Get.width,
        margin: EdgeInsets.zero,
        borderRadius: 4);
  }

  static List<String> getPasswordRequirements(String password) {
    List<String> requirements = [];

    if (password.length < 8) {
      requirements.add('Le mot de passe doit contenir au moins 8 caractères.');
    }

    if (!password.contains(RegExp(r'\d'))) {
      requirements.add('Le mot de passe doit contenir au moins un chiffre.');
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      requirements.add('Le mot de passe doit contenir au moins une lettre minuscule.');
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      requirements.add('Le mot de passe doit contenir au moins une lettre majuscule.');
    }

    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      requirements.add('Le mot de passe doit contenir au moins un caractère spécial.');
    }

    return requirements;
  }

  static getSnackbarSuccess(String title, String text, [icon]) {
    Get.closeCurrentSnackbar();
    Get.closeAllSnackbars();
    return Get.snackbar(
      title,
      text,
      icon: Icon(icon ?? Icons.error, color: Colors.white),
      backgroundColor: const Color.fromARGB(255, 0, 187, 115),
      duration: const Duration(seconds: 6),
      animationDuration: const Duration(milliseconds: 300),
      snackStyle: SnackStyle.GROUNDED,
      isDismissible: true,
      colorText: Colors.white,
      maxWidth: Get.width,
      margin: EdgeInsets.zero,
      borderRadius: 4,
    );
  }
}