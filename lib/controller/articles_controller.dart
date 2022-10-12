import 'package:emais/constants/endpoints.dart';
import 'package:emais/models/article.dart';
import 'package:get/get.dart';
import '../models/custom_response.dart';
import '../services/http_manager.dart';

class ArticlesController extends GetxController {

   final HttpManager _httpManager = HttpManager();
   List<Article> allArticles = List.empty();
   RxBool isLoading = false.obs;
   RxList<Article> articles =  RxList.empty();
   Article? article;
   String query = '';

   void set() async {
    isLoading.value = true;
    CustomResponse response = await _httpManager.restRequest(url: EndPoints.articles, method: HttpMethods.get);
    Future.delayed(const Duration(milliseconds: 500));
    if(response.statusCode == 200 ) {
      List<dynamic> dynamicArticles = response.data!['artigos'];
      articles.value = dynamicArticles.map((e) => Article.fromJson(e)).toList();
      allArticles = List<Article>.from(articles);
    }
    isLoading.value = false;
  }


   void searchArticle(String query) {
     articles.value = allArticles;
     articles.value = allArticles.where((articles) {
       final titleLower = articles.title.toLowerCase();
       final authorLower = articles.author.toLowerCase();
       final searchLower = query.toLowerCase();

       return titleLower.contains(searchLower) ||
           authorLower.contains(searchLower);
     }).toList();
   }


}