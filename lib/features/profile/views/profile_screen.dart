import 'package:flutter/material.dart';
import 'package:githubdummy/base/view/base_view.dart';
import 'package:githubdummy/config/router/router_config.dart';
import 'package:githubdummy/features/profile/view_model/profile_view_model.dart';
import 'package:githubdummy/widgets/card_view.dart';
import 'package:go_router/go_router.dart';

class ProfileScreenWithProvider extends StatelessWidget {
  const ProfileScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen();
  }
}

class ProfileScreen extends BaseView<ProfileViewModel> {
  ProfileScreen({super.key})
      : super(
          viewModel: ProfileViewModel(),
        );

  @override
  String appBarTitle() => 'Profile';

  @override
  Widget buildScreen(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: viewModel.loginController.loginController,
          builder: (context, value, child) {
            if (!value) {
              context.goNamed(AppRoute.login);
            }
            return const SizedBox.shrink();
          },
        ),
        viewModel.isFetched
            ? CardView(
                user: viewModel.user!,
                profileViewModel: viewModel,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   ProfileViewModel profileViewModel = context.watch<ProfileViewModel>();
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Profile'),
  //     ),
  //     body: Stack(
  //       children: [
  //         ValueListenableBuilder(
  //             valueListenable: profileViewModel.loginController.loginController,
  //             builder: (context, value, child) {
  //               if (!value) {
  //                 // WidgetsBinding.instance.addPostFrameCallback((_) {
  //                 context.goNamed(AppRoute.login);
  //                 // });
  //               }
  //               return const SizedBox.shrink();
  //             }),
  //         profileViewModel.isFetched
  //             ? CardView(
  //                 user: profileViewModel.user!,
  //                 profileViewModel: profileViewModel,
  //               )
  //             : const Center(
  //                 child: CircularProgressIndicator(),
  //               ),
  //       ],
  //     ),
  //   );
  // }
}
