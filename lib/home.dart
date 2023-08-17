import 'package:flutter/material.dart';
import 'package:test_r/edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 190,
              ),
              const Text(
                "Résumé ",
                style: TextStyle(
                  fontFamily: "futura",
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: const [
                  Text(
                    "Nom d'utilisateur: ",
                    style: TextStyle(
                      fontFamily: "futura",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    " Lorenda",
                    style: TextStyle(
                      fontFamily: "futura",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Text(
                    "Mon Mot de passe: ",
                    style: TextStyle(
                      fontFamily: "futura",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    " Lorenda2001",
                    style: TextStyle(
                      fontFamily: "futura",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 190,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditScreen(),
                        ));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(const Color(0xffF27E06)),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            side: BorderSide(
                              color: Color(0xffF27E06),
                            )),
                      ),
                      elevation: MaterialStateProperty.all(0)),
                  child: const Text(
                    "Modifier les données",
                    style: TextStyle(
                      fontFamily: "futura",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
      )
    );
  }
}
