
import 'package:emais/constants/endpoints.dart';

import 'http_manager.dart';

class AuthService {

  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    return _httpManager.restRequest(url: EndPoints.signin, method: HttpMethods.post, body: {
      'email' : email,
      'password': password
    });
  }

  Future signUp({required String email, required String password, required String userName, required String phone}) async {
    return _httpManager.restRequest(url: EndPoints.signup, method: HttpMethods.post, body: {
      'email' : email,
      'password': password,
      'username': userName,
      'phone': phone
    });
  }

  Future getUser(String token) async {
    return _httpManager.restRequest(url: EndPoints.user, method: HttpMethods.get, headers: {
      'x-access-token': token
    });
  }

}