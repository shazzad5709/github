import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:githubdummy/features/search_repositories/models/repository_ui_model.dart';
import 'package:githubdummy/features/search_repositories/view_model/search_repository_view_model.dart';
import 'package:provider/provider.dart';

class RepoHeader extends StatelessWidget {
  const RepoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchRepoViewModel repoViewModel = context.watch<SearchRepoViewModel>();
    RepositoryModel repo = repoViewModel.selectedRepo!;

    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ownerInfo(repo),
            const SizedBox(height: 12),
            _repoName(repo.name ?? ''),
            const SizedBox(height: 4),
            _singleLineMediumText(repo.description ?? ''),
            const SizedBox(height: 12),
            _homepageLink(repo),
            const SizedBox(height: 8),
            _starsAndForks(repo),
            _buttons()
          ],
        ),
      ),
    );
  }

  Padding _buttons() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 6.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(194, 15, 15, 15),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    const Icon(
                      CupertinoIcons.star,
                      color: Colors.white70,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    _singleLineMediumText(TextStrings.starButton.toUpperCase()),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(194, 15, 15, 15),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Icon(
                CupertinoIcons.bell,
                size: 20,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _starsAndForks(RepositoryModel repo) {
    return Row(
      children: [
        Icon(
          CupertinoIcons.star_fill,
          color: Colors.grey[600],
          size: 18,
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            _singleLineBrightText(repo.stargazersCount != null
                ? '${(repo.stargazersCount!.toInt() / 1000).toStringAsFixed(1)}k'
                : ''),
            const SizedBox(width: 4),
            _singleLineLightText(TextStrings.stars),
          ],
        ),
        const SizedBox(width: 20),
        Icon(
          CupertinoIcons.command,
          color: Colors.grey[600],
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          '${(repo.forksCount!.toInt() / 1000).toStringAsFixed(1)}k',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          'forks',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Row _homepageLink(RepositoryModel repo) {
    return Row(
      children: [
        Icon(
          CupertinoIcons.link,
          size: 18,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 8),
        _singleLineBrightText(
          repo.homepage!.isNotEmpty ? repo.homepage!.substring(8) : '',
        ),
      ],
    );
  }

  Text _repoName(String name) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Row _ownerInfo(RepositoryModel repo) {
    return Row(
      children: [
        _ownerAvatar(repo),
        const SizedBox(width: 8),
        _singleLineLightText(repo.owner?.login ?? ''),
      ],
    );
  }

  Text _singleLineLightText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 18,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _singleLineBrightText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _singleLineMediumText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 18,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  ClipRRect _ownerAvatar(RepositoryModel repo) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: SizedBox(
        height: 24,
        width: 24,
        child: repo.owner?.avatarUrl != null && repo.owner!.avatarUrl!.isNotEmpty
            ? Image.network(
                repo.owner!.avatarUrl!,
                fit: BoxFit.cover,
              )
            : const Icon(
                CupertinoIcons.person_crop_circle_fill,
                color: Colors.white60,
                size: 24,
              ),
      ),
    );
  }
}
