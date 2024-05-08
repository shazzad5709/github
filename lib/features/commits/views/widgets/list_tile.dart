import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommitListTile extends StatelessWidget {
  const CommitListTile({
    super.key,
    this.onTap,
    required this.message,
    required this.author,
    required this.avatarUrl,
    required this.time,
    required this.verified,
  });

  final VoidCallback? onTap;
  final String message;
  final String author;
  final String avatarUrl;
  final String time;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: double.infinity,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                message,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              verified
                                  ? CupertinoIcons.check_mark
                                  : CupertinoIcons.xmark,
                              size: 16,
                              color: verified ? Colors.green : Colors.red,
                            ),
                            const SizedBox(width: 4),
                            Text(time),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.black,
                              backgroundImage: avatarUrl != ''
                                  ? NetworkImage(avatarUrl)
                                  : null,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$author authored',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 0.2,
          ),
        ],
      ),
    );
  }
}
