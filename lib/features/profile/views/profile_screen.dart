import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:githubdummy/config/router/router_config.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:githubdummy/features/profile/view_model/profile_view_model.dart';
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
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.goNamed(AppRoute.login);
                  });
                }
                return const SizedBox.shrink();
              }),
          profileViewModel.isFetched
              ? _buildProfile(profileViewModel.user, profileViewModel)
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }

  Widget _buildProfile(CurrentUser? user, ProfileViewModel profileViewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user!.avatarUrl!),
              ),
              const SizedBox(width: 16),
              _buildHandle(user)
            ],
          ),
          const SizedBox(height: 16),
          _buildBio(user),
          const SizedBox(height: 24),
          user.location != null ? _buildLocation(user) : const SizedBox.shrink(),
          _buildFollowersAndFollowing(user),
          const SizedBox(height: 196),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: _buildLogoutButton(profileViewModel),
          ),
        ],
      ),
    );
  }

  OutlinedButton _buildLogoutButton(ProfileViewModel profileViewModel) {
    return OutlinedButton(
      onPressed: profileViewModel.logout,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white, width: 100),
        ),
      ),
      child: Text(
        TextStrings.signOut.toUpperCase(),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Row _buildFollowersAndFollowing(CurrentUser user) {
    return Row(
      children: [
        const Icon(CupertinoIcons.person, color: Colors.white54),
        const SizedBox(width: 8),
        Text(
          user.followersCount.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          TextStrings.followers,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white54,
          ),
        ),
        const SizedBox(width: 16),
        const Icon(CupertinoIcons.circle_fill, size: 6),
        const SizedBox(width: 8),
        Text(
          user.followersCount.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          TextStrings.following,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white54,
          ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  Row _buildLocation(CurrentUser user) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.white54),
        const SizedBox(width: 8),
        Text(
          user.location!,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Text _buildBio(CurrentUser user) {
    return Text(
      user.bio ?? 'No bio',
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  Column _buildHandle(CurrentUser user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name!,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          user.login!,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}
