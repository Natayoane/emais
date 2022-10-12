import 'package:emais/compoents/custom_app_bar.dart';
import 'package:emais/compoents/custom_button.dart';
import 'package:emais/controller/articles_controller.dart';
import 'package:emais/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const CustomAppBar().build(context),
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
        child: GetX<ArticlesController>(
          builder: (articlesController) {
            return articlesController.isLoading.value
                ? const CircularProgressIndicator()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Padding(
                          padding: const EdgeInsets.all(16).copyWith(top: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  articlesController.article!.title,
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
                                  articlesController.article!.author,
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
                            image: NetworkImage(
                                articlesController.article!.urlImage),
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16).copyWith(bottom: 6),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  articlesController.article!.description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ])),
                    ],
                  );
          },
        ),
      );
}
