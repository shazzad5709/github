import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubdummy/constants/text_strings.dart';

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
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
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
                        _commitDetails(),
                        const SizedBox(height: 4),
                        _authorInfo(),
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

  _commitDetails() {
    return Row(
      children: [
        Expanded(
          child: _singleLineBrightText(message),
        ),
        const SizedBox(width: 16),
        Icon(
          verified ? CupertinoIcons.checkmark_alt : CupertinoIcons.xmark,
          size: 16,
          color: verified ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 4),
        Text(time),
      ],
    );
  }

  _authorInfo() {
    return Row(
      children: [
        _avatar(avatarUrl),
        const SizedBox(width: 8),
        _singleLineBrightText(author),
        const SizedBox(width: 6),
        _singleLineLightText(TextStrings.commitAuthored),
      ],
    );
  }

  _avatar(String avatarUrl) {
    return CircleAvatar(
      radius: 8,
      backgroundColor: Colors.black,
      backgroundImage: avatarUrl != '' ? NetworkImage(avatarUrl) : null,
    );
  }

  _singleLineLightText(String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 16,
      ),
    );
  }

  _singleLineBrightText(String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
