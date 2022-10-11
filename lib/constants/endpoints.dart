const String baseUrl = 'https://api.wfreitas.dev/emais';

abstract class EndPoints {
  static const String signin = '$baseUrl/api/auth/signin';
  static const String signup = '$baseUrl/api/auth/signup';
  static const String user = '$baseUrl/api/user';
}