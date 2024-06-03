import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetImageView extends StatelessWidget {
  const AssetImageView({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final extension = imageUrl.split('.').last.toLowerCase();

    if (extension == 'svg') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: SvgPicture.asset(
          width: width,
          height: height,
          imageUrl,
          fit: fit,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image(
          image: AssetImage(imageUrl),
          width: width,
          height: height,
          fit: fit,
        ),
      );
    }
  }
}
