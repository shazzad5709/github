import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github/features/search_repositories/models/repository_ui_model.dart';
import 'package:github/features/search_repositories/view_model/search_repository_view_model.dart';
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
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: repo.owner?.avatarUrl != null &&
                            repo.owner!.avatarUrl!.isNotEmpty
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
                ),
                const SizedBox(width: 8),
                Text(
                  repo.owner?.login ?? '',
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              repo.name ?? '',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              repo.description ?? '',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  CupertinoIcons.link,
                  size: 18,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 8),
                Text(
                  repo.homepage!.isNotEmpty ? repo.homepage!.substring(8) : '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.grey[600],
                  size: 18,
                ),
                const SizedBox(width: 8),
                Row(
                  children: [
                    Text(
                      '${(repo.stargazersCount!.toInt() / 1000).toStringAsFixed(1)}k',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'stars',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                      ),
                    ),
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
            ),
            Padding(
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Icon(
                              CupertinoIcons.star,
                              color: Colors.white70,
                              size: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'STAR',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              ),
                            ),
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
            )
          ],
        ),
      ),
    );
  }
}
