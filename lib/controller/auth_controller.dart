
import 'package:emais/config/utils_services.dart';
import 'package:emais/constants/mensagens.dart';
import 'package:emais/models/custom_response.dart';
import 'package:emais/models/user_model.dart';
import 'package:emais/pages_routes/app_pages.dart';
import 'package:emais/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLogged = false.obs;

  final authService = AuthService();

  signIn({required String email, required String pass, required context}) async {
    isLoading.value = true;
    try {
      CustomResponse response = await authService.signIn(email: email, password: pass);
      if(response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.data!);
        Get.offNamed(PagesRoutes.baseRoute);
      } else if(response.error == 'Invalid Autentication') {
          _error(context, Mensagens.errorUserPassword);
      }
    } catch (error) {
      log(error.toString());
      _error(context, Mensagens.genaricError);
    }
    isLoading.value = false;
  }

  signUp({required String name, required String email,
    required  String phone, required String password, required  context}) async {
    isLoading.value = true;

    try {
      await authService.signUp(email: email, password: password, phone: phone, userName: name);
      Get.offNamed(PagesRoutes.signInRoute);
      _sucessSignUp(context);
    }catch (error) {
      log(error.toString());
      _error(context, Mensagens.genaricError);
    }
    isLoading.value = false;
  }

    sessionValidate() async {
      isLogged.value = false;
    try {
      String? token = await UtilsServices().getLocalData(key: 'token');
      if(token == null) {
        isLogged.value = false;
        return false;
      }
      CustomResponse response = await authService.getUser();
      if(response.statusCode == 200) {
        isLogged.value = true;
      }
    } catch (error) {
      log(error.toString());
    }
    return false;
  }

  logoff() async {
    isLoading.value = false;
    await UtilsServices().removeLocalData(key: 'token');
  }

   _sucessSignUp(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: const Text(Mensagens.sucessRegister),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            // Code to execute.
          },
        ),
      ),
    );
  }

  _error(context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(msg)),
    );
  }
}
