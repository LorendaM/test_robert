// ignore_for_file: file_names, unrelated_type_equality_checks
// ignore_for_file: unused_element, empty_constructor_bodies, unnecessary_this, prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables, avoid_print, non_constant_identifier_names, curly_braces_in_flow_control_structures, constant_identifier_names, unused_import, prefer_if_null_operators, unused_field, use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../app.dart';
import '../models/user_model.dart';
import '../service/api_service.dart';
import 'localstorage.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final BuildContext context;

  bool loading = false;
  bool request = false;
  bool isObscured = true;
  bool isObscuredC = true;

  AuthenticationNotifier({required this.context}) {
    init();
  }

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    timer?.cancel();
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  init() async {
    loading = true;
    loading = false;
    notifyListeners();
  }


  Timer? timer;

  toggleShowPassword() {
    isObscured = !isObscured;
    notifyListeners();
  }

  toggleShowPasswordC() {
    isObscuredC = !isObscuredC;
    notifyListeners();
  }
  bool isPasswordStrong = true;

  List<String> passwordRequirements = [];

  void validatePassword(String password) {
    isPasswordStrong = App.getPasswordRequirements(password).isEmpty;
    passwordRequirements = App.getPasswordRequirements(password);
    notifyListeners();
  }
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passworcd = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();
  TextEditingController oldPassword = TextEditingController();


  signin() async {
    try {
      request = true;
      notifyListeners();

      var result =
          await RequestApiService.signin(username.text, password.text);
      if (result is UserModel) {
        await LocalStorage.setUserLogged(result);
        Get.offAllNamed('/home');
      }
      request = false;
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      request = false;
      notifyListeners();
    }
  }


  registerUser( String username, String password, String passwordConfirm) async {
    try {
      request = true;
      notifyListeners();
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        var result = await RequestApiService.register( username, password, passwordConfirm);

        if (result == true) {
          var result = await RequestApiService.signin(username, password);
          if (result is UserModel) {
            await LocalStorage.setUserLogged(result);
          }
        }
      }

      request = false;
      notifyListeners();
    } catch (e) {
      request = false;
      notifyListeners();
      print(e);
    }
  }

  bool accept = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}

final authenticationRepository =
    ChangeNotifierProvider.autoDispose.family<AuthenticationNotifier,
        BuildContext>((ref, context) => AuthenticationNotifier(context: context));
