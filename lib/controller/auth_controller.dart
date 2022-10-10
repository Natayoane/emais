import 'package:get/get.dart';


class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  signIn({required String email, required String pass}) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    isLoading.value = false;
  }



}
