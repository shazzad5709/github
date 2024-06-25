import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubdummy/router/router_config.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:go_router/go_router.dart';
import 'widgets/repo_header.dart';
import 'widgets/repo_info.dart';

class RepositoryDetailsScreen extends StatelessWidget {
  const RepositoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RepoHeader(),
            const SizedBox(height: 16),
            const RepoInfo(),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => context.pushNamed(AppRoute.commits),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.arrow_counterclockwise,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      TextStrings.commits,
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
