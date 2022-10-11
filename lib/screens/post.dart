import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/fundo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset("images/logo2.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: buildArticle(),
            ),
          ],
        ),
      ));

  Widget buildArticle() => Card(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Padding(
                padding: const EdgeInsets.all(16).copyWith(top: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        'a',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        'Por s',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ]),
              )
            ]),
            Stack(
              children: [
                Ink.image(
                  image: const NetworkImage(
                      'https://st2.depositphotos.com/6544740/9337/i/600/depositphotos_93376372-stock-photo-sunset-over-sea-pier.jpg'),
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(16).copyWith(bottom: 6),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        'h',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ])),
          ],
        ),
      );
}
