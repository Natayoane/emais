// ignore_for_file: deprecated_member_use
import 'package:emais/compoents/custom_button.dart';
import 'package:emais/compoents/text_button_align.dart';
import 'package:emais/controller/auth_controller.dart';
import 'package:emais/validations/form_auth_validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../compoents/custom_input.dart';
import '../pages_routes/app_pages.dart';
import 'package:flutter/animation.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fundo.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  CustomInput(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    controller: emailController,
                    validator: EmailValidate,
                  ),
                  CustomInput(
                    icon: Icons.lock,
                    label: 'Senha',
                    isSecret: true,
                    controller: passwordController,
                    validator: PasswordValidate,
                  ),
                  TextButtonAlign(
                      label: 'Não tenho cadastro',
                      onPressed: () {
                        Get.toNamed(PagesRoutes.signUpRoute);
                      }),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return CustomButton(
                              label: 'Entrar',
                              loading: authController.isLoading.value,
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        authController.signIn(
                                            email: emailController.text,
                                            pass: passwordController.text);
                                      }
                                    },
                            );
                          },
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
