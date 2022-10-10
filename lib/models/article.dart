import 'author.dart';

class Article {
  final int id;
  final String author;
  final String title;
  final String subTitle;
  // final Author author;
  final String urlImage;
  final String description;

  const Article({
    required this.id,
    required this.author,
    required this.title,
    required this.subTitle,
    required this.urlImage,
    required this.description,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json['id'],
        author: json['author'],
        title: json['title'],
        subTitle: json['subTitle'],
        urlImage: json['urlImage'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subTitle': subTitle,
        'author': author,
        'urlImage': urlImage,
        'description': description
      };
}
