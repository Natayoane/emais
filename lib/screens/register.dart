// ignore_for_file: deprecated_member_use
import 'package:emais/compoents/custom_button.dart';
import 'package:emais/compoents/custom_input.dart';
import 'package:emais/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final phoneController = TextEditingController();

  final phoneFormatter = MaskTextInputFormatter(
      mask: '## # ####-####', filter: {'#': RegExp(r'\d')});

  RegisterWidget({Key? key}) : super(key: key);

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
                image: AssetImage("images/fundo.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset("images/logo.png"),
                    ),
                  ),
                  CustomInput(
                    icon: Icons.person,
                    label: 'Nome Completo',
                    controller: nameController,
                  ),
                  CustomInput(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    controller: emailController,
                  ),
                  CustomInput(
                    icon: Icons.phone,
                    label: 'Telefone',
                    controller: phoneController,
                    inputFormatters: [phoneFormatter],
                  ),
                  CustomInput(
                    icon: Icons.lock,
                    label: 'Senha',
                    controller: passwordController,
                    isSecret: true,
                  ),
                  CustomInput(
                    icon: Icons.lock,
                    label: 'Confirme sua senha',
                    controller: passwordConfirmController,
                    isSecret: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
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
                                  authController.signUp(name: nameController.text,
                                      email: emailController.text, phone: phoneController.text,
                                      password: passwordController.text, context: context);
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
