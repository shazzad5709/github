import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github/features/search_repositories/models/repository_ui_model.dart';

class RepoHeader extends StatelessWidget {
  const RepoHeader({
    super.key,
    required this.repo,
  });

  final RepositoryModel repo;

  @override
  Widget build(BuildContext context) {
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
                    height: 20,
                    width: 20,
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
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              repo.name ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              repo.description ?? '',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  CupertinoIcons.link,
                  size: 16,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 8),
                Text(repo.homepage!.isNotEmpty
                    ? repo.homepage!.substring(8)
                    : '')
              ],
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.yellow[700],
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  '${(repo.stargazersCount!.toInt() / 1000).toStringAsFixed(1)}k',
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  CupertinoIcons.circle_fill,
                  color: Colors.teal,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  repo.language ?? '',
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
