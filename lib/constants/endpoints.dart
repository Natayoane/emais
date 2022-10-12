// const String baseUrl = 'https://api.wfreitas.dev/emais';
 const String baseUrl = 'http://192.168.15.5:8181';

abstract class EndPoints {
  static const String signin = '$baseUrl/api/auth/signin';
  static const String signup = '$baseUrl/api/auth/signup';
  static const String user = '$baseUrl/api/user';
  static const String articles = '$baseUrl/api/articles';
}