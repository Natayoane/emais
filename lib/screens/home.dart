import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final urlImage = 'images/fundo.png';

    return Scaffold(
      body: Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(urlImage),
              fit: BoxFit.cover,
            ),
          ),
          child:
              // ignore: prefer_const_literals_to_create_immutables
              Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/logo.png',
                height: 219,
                width: 219,
              ),
              const Text("Que bom te ver aqui!!")
            ],
          )),
    );
  }
}

// child: Text('Que bom ver você aqui!'),