// ignore_for_file: deprecated_member_use

import 'package:emais/compoents/custom_button.dart';
import 'package:emais/compoents/custom_search.dart';
import 'package:emais/controller/articles_controller.dart';
import 'package:emais/data/article_data.dart';
import 'package:emais/models/article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages_routes/app_pages.dart';

class ArticlesWidget extends StatefulWidget {
  const ArticlesWidget({Key? key}) : super(key: key);

  @override
  State<ArticlesWidget> createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> {
  late List<Article> articles;
  String query = '';

  @override
  void initState() {
    super.initState();
    ArticlesController articlesController = Get.find<ArticlesController>();
    articlesController.set();
  }

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
          children: [
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
            buildSearch(),
            GetX<ArticlesController>(
              builder: (artController) {
                articles = artController.articles;

                return !artController.isLoading.value
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            return buildArticle(article);
                          },
                        ),
                      )
                    : const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ));

  Widget buildSearch() => CustomSearch(
        text: query,
        hintText: 'Pesquise aqui',
        onChanged: searchArticle,
      );

  Widget buildArticle(Article article) => Card(
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Por @${article.author}',
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
                  image: NetworkImage(article.urlImage),
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(16).copyWith(bottom: 6),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.subTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                          label: 'Ver mais',
                          color: const Color.fromARGB(255, 245, 169, 184),
                          onPressed: () {
                            Get.toNamed(PagesRoutes.postRoute);
                          },
                        ),
                      ),
                    ])),
          ],
        ),
      );

  void searchArticle(String query) {
    final articles = allArticles.where((articles) {
      final titleLower = articles.title.toLowerCase();
      final authorLower = articles.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.articles = articles;
    });
  }
}
