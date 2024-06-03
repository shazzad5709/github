import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:githubdummy/constants/image_url.dart';
import 'package:githubdummy/widgets/asset_image_view.dart';

class NetworkImageView extends StatelessWidget {
  const NetworkImageView({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0,
    this.placeholder,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) {
          return AssetImageView(
            imageUrl: placeholder ?? ImageUrl.placeholder,
            width: width,
            height: height,
            fit: fit,
            borderRadius: borderRadius,
          );
        },
      ),
    );
  }
}
