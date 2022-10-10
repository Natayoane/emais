// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import 'articles.dart';
import 'register.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);
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
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: "E-mail",
                // ignore: prefer_const_constructors
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color.fromARGB(150, 255, 255, 255),
                  width: 1,
                )),
              ),

              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: "Senha",
                // ignore: prefer_const_constructors
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color.fromARGB(150, 255, 255, 255),
                  width: 1,
                )),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Text(
                    "Não tenho cadastro",
                    // ignore: unnecessary_const
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterWidget(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ArticlesWidget(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
