import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:githubdummy/config/router/router_config.dart';
import 'package:githubdummy/constants/image_url.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void redirect(BuildContext context) {
    final prefs = GetStorage();
    final token = prefs.read(TextStrings.ACCESS_TOKEN);
    if (token != null) {
      context.goNamed(AppRoute.home);
    } else {
      context.goNamed(AppRoute.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    redirect(context);

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          image: AssetImage(ImageUrl.invertocatLogo),
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
