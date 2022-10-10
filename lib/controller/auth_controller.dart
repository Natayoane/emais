
import 'package:emais/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  signIn({required String email, required String pass}) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    isLoading.value = false;
    Get.offNamed(PagesRoutes.baseRoute);
  }

  signUp({required String name, required String email,
    required  String phone, required String password, required  context}) async {

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    isLoading.value = false;
    Get.offNamed(PagesRoutes.signInRoute);
    _sucessSignUp(context);
  }

   _sucessSignUp(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Usuario cadastrado com sucesso!!'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            // Code to execute.
          },
        ),
      ),
    );
  }


}
