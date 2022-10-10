import 'package:get/get.dart';


String? EmailValidate (String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email!';
  }
  if (!email.isEmail) return 'Digite um Email Valido';
  return null;
}

String? PasswordValidate (String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua Senha!';
  }
  if (password.length < 7) {
    return 'A senha precisa ter no minimo 7 caracteres';
  }
  return null;
}
