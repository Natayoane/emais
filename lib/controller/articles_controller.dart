import 'package:emais/constants/endpoints.dart';
import 'package:emais/models/article.dart';
import 'package:get/get.dart';
import '../models/custom_response.dart';
import '../services/http_manager.dart';

class ArticlesController extends GetxController {

   final HttpManager _httpManager = HttpManager();
   RxBool isLoading = false.obs;
   RxList<Article> articles =  RxList.empty();

   void set() async {
    isLoading.value = true;
    CustomResponse response = await _httpManager.restRequest(url: EndPoints.articles, method: HttpMethods.get);
    Future.delayed(const Duration(milliseconds: 500));
    if(response.statusCode == 200 ) {
      List<dynamic> dynamicArticles = response.data!['artigos'];
      articles.value = dynamicArticles.map((e) => Article.fromJson(e)).toList();
    }
    isLoading.value = false;
  }



}