// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last, unnecessary_string_escapes, prefer_interpolation_to_compose_strings, duplicate_ignore, avoid_returning_null_for_void, body_might_complete_normally_nullable

// ignore_for_file : prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, avoid_print, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_adjacent_string_concatenation, unnecessary_brace_in_string_interps, unused_import, void_checks, unnecessary_import, curly_braces_in_flow_control_structures, unnecessary_null_comparison, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:test_r/home.dart';
import 'package:test_r/provider/authentication_provider.dart';
import 'package:test_r/signin_screen.dart';
class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

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
            child: Form(
              key: provider.formKey,
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 60,
                ),
                const Center(
                  child: Text(
                    "Inscription",
                    style: TextStyle(
                      fontFamily: "futura",
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 80,
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
                      hintText: 'Mot de passe',
                    ),
                    textCapitalization: TextCapitalization.words,
                    controller: provider.password,

                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Confirmer le mot de passe",
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
                      hintText: 'Confirmation',
                    ),
                    textCapitalization: TextCapitalization.words,
                    controller: provider.passworcd,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    provider.accept = !provider.accept;
                    provider.notifyListeners();
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Checkbox(
                            value: provider.accept,
                            fillColor: MaterialStateProperty
                                .resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states
                                      .contains(MaterialState.disabled)) {
                                    return Color(0xffF27E06);
                                  }
                                  return Color(0xffF27E06);
                                }),
                            onChanged: (v) {
                              provider.accept = v!;

                              provider.notifyListeners();
                            }),
                        Text("J'accepte les conditions et"),
                        TextButton(
                          onPressed: () {
                          },
                          child: Text(
                            'term',
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: provider.accept
                      ? () {
                    provider.registerUser;
                  }
                      : null,
                  child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: provider.accept
                              ? Color(0xffF27E06)
                              : Colors.grey,
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
                        "Inscription",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Vous avez un compte ? \n",
                        children: <TextSpan>[
                          TextSpan(
                              text: " Se connecter",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.off(() => SigninScreen())
                          ),
                        ],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
