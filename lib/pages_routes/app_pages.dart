import 'package:emais/screens/articles.dart';
import 'package:emais/screens/login.dart';
import 'package:emais/screens/register.dart';
import 'package:get/get.dart';
import '../screens/post.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => RegisterWidget(),
    ),
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => LoginWidget(),
    ),
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => const ArticlesWidget(),
    ),
    GetPage(
      name: PagesRoutes.postRoute,
      page: () => const PostWidget(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String signUpRoute = '/signup';
  static const String signInRoute = '/signin';
  static const String baseRoute = '/';
  static const String postRoute = '/post';
}
