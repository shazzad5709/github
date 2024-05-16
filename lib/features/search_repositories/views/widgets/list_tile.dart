import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/repository_ui_model.dart';

class CListTile extends StatelessWidget {
  const CListTile({
    super.key,
    required this.item,
    this.onTap,
  });

  final RepositoryModel item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ownerInfo(),
                const SizedBox(height: 4),
                _repoName(),
                const SizedBox(height: 4),
                _singleLineLightText(item.description ?? ''),
                const SizedBox(height: 6),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          color: Colors.yellow[700],
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        _singleLineLightText(item.stargazersCount != null
                            ? '${(item.stargazersCount!.toInt() / 1000).toStringAsFixed(1)}k'
                            : ''),
                        const SizedBox(width: 16),
                        const Icon(
                          CupertinoIcons.circle_fill,
                          color: Colors.teal,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        _singleLineLightText(item.language ?? ''),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
        ],
      ),
    );
  }

  Text _repoName() {
    return Text(
      item.name ?? '',
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Row _ownerInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundImage:
              item.owner?.avatarUrl != null ? NetworkImage(item.owner!.avatarUrl!) : null,
        ),
        const SizedBox(width: 8),
        Text(
          item.owner?.login ?? '',
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Text _singleLineLightText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 16,
      ),
    );
  }
}
