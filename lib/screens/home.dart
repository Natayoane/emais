// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/fundo.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("images/logo.png"),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Que bom te ver aqui!",
              // ignore: unnecessary_const
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 150,
            ),
            Container(
              height: 55,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 91, 205, 250),
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        "Cadastrar-se",
                        // ignore: unnecessary_const
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => HomePage(),
                    //   ),
                    // );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 55,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 91, 205, 250),
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        "Entrar",
                        // ignore: unnecessary_const
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
