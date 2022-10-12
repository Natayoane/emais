import 'package:emais/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages_routes/app_pages.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff2d7186),
      centerTitle: true,
      title: SizedBox(
        width: 50,
        height: 50,
        child: Image.asset("images/logo2.png"),
      ),
      actions: [
        IconButton(onPressed: () async {
          await Get.find<AuthController>().logoff();
          Get.offNamed(PagesRoutes.signInRoute);
        }, icon: const Icon(Icons.exit_to_app))
      ],
    );
  }
}
