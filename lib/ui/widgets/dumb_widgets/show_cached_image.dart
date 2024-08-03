import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watch_next/contants/constansts.dart';

class ShowCachedImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String? posterUrl;
  final BoxFit? boxFit;

  const ShowCachedImage(
      {super.key,
      required this.posterUrl,
      this.height,
      this.width,
      this.boxFit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      useOldImageOnUrlChange: true,
      cacheManager: Constansts.customCacheManager,
      key: UniqueKey(),
      imageUrl: posterUrl!,
      fit: boxFit,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fadeInDuration: const Duration(seconds: 3),
    );
  }
}
