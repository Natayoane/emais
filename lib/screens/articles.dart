import 'package:flutter/material.dart';
import '../data/article_data.dart';
import '../models/article.dart';
import '../compoents/custom_search.dart';

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

    articles = allArticles;
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
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset("images/logo.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return buildArticle(article);
                },
              ),
            ),
          ],
        ),
      ));

  Widget buildSearch() => CustomSearch(
        text: query,
        hintText: 'Pesquise aqui',
        onChanged: searchArticle,
      );

  Widget buildArticle(Article article) => ListTile(
        leading: Image.network(
          article.urlImage,
          fit: BoxFit.fitWidth,
          width: 50,
          height: 50,
        ),
        title: Text(article.title),
        subtitle: Text(article.subTitle),
        textColor: Colors.white,
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
