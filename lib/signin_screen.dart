// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import, unused_local_variable

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:test_r/provider/authentication_provider.dart';
import 'package:test_r/signup_screen.dart';

import 'home.dart';

class SigninScreen extends ConsumerWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authenticationRepository(context));
    return Scaffold(
      body: SafeArea(
        child: provider.loading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Center(
              child: Form(
                key:provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 130,
                    ),
                    const Center(
                      child: Text(
                        "Connexion",
                        style: TextStyle(
                          fontFamily: "futura",
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      "Mon d'utilisateur",
                      style: TextStyle(
                        fontFamily: "futura",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SizedBox(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            filled: true,
                            fillColor: Color(0xffF6F6F6),
                            contentPadding: EdgeInsets.all(5),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: "Nom d'utilisateur",
                          ),
                          textCapitalization: TextCapitalization.words,
                          controller: provider.username,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Mot de passe",
                      style: TextStyle(
                        fontFamily: "futura",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(provider.isObscured
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: provider.toggleShowPassword,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          filled: true,
                          fillColor: Color(0xffF6F6F6),
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: 'mot de passe',
                        ),
                        textCapitalization: TextCapitalization.words,
                        controller: provider.password,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: provider.isPasswordStrong
                          ? () {
                        provider.signin();
                      }
                          : null,
                      child:  Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: provider.isPasswordStrong ? Color(0xffF27E06) : Colors.grey,
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: provider.request
                              ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                backgroundColor: Colors.transparent,
                                strokeWidth: 3,
                              ))
                              : Text(
                            "Connexion",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10),
                        child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text:  "Vous n'avez pas de compte ? \n",
                                children: <TextSpan>[
                                  TextSpan(
                                      text: " S'inscrire maintenant",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            Get.off(() => SignupScreen())
                                  ),
                                ],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),
                              ),)))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
