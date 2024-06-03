import 'package:flutter/material.dart';
import 'package:githubdummy/widgets/network_image_view.dart';

class CircularAvatarView extends StatelessWidget {
  const CircularAvatarView(
      {super.key,
      required this.imageUrl,
      this.width = 50,
      this.height = 50,
      this.borderRadius,
      this.fit});

  final String imageUrl;
  final double width, height;
  final double? borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return NetworkImageView(
      imageUrl: imageUrl,
      width: width,
      height: height,
      borderRadius: borderRadius ?? width,
      fit: fit ?? BoxFit.cover,
    );
  }
}
