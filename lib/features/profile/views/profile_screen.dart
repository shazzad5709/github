import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:githubdummy/config/router/router_config.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:githubdummy/features/profile/view_model/profile_view_model.dart';
import 'package:githubdummy/widgets/card_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileScreenWithProvider extends StatelessWidget {
  const ProfileScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileViewModel profileViewModel = context.watch<ProfileViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Stack(
        children: [
          ValueListenableBuilder(
              valueListenable: profileViewModel.loginController.loginController,
              builder: (context, value, child) {
                if (!value) {
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.goNamed(AppRoute.login);
                  // });
                }
                return const SizedBox.shrink();
              }),
          profileViewModel.isFetched
              ? CardView(
                  user: profileViewModel.user!,
                  profileViewModel: profileViewModel,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
