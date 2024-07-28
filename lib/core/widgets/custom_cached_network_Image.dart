import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:olx_bloc/core/const/assets.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double width;
  final double height;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit ?? BoxFit.fill,
        errorWidget: (context, url, error) => Image.asset(
              AppAssets.logo,
              fit: fit ?? BoxFit.fill,
            ));
  }
}
