import 'package:flutter/material.dart';
import 'package:githubdummy/config/router/router_config.dart';
import 'package:githubdummy/constants/image_url.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:githubdummy/features/auth/view_model/auth_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();

    void Function() login() {
      return () async {
        authViewModel.login();
      };
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ValueListenableBuilder(
              valueListenable: authViewModel.loginController.loginController,
              builder: (context, value, child) {
                if (value) {
                  context.goNamed(AppRoute.home);
                }
                return const SizedBox.shrink();
              }),
          Column(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 128.0),
                  child: Center(
                    child: Image(
                      image: AssetImage(ImageUrl.invertocatLogo),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 144.0, left: 16.0, right: 16.0),
                child: ElevatedButton(
                  onPressed: login(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    TextStrings.signIn.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
