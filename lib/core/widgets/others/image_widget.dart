import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    required this.borderRadius,
    this.width,
    this.height,
    this.network = false,
  });

  final String image;
  final double borderRadius;
  final double? width;
  final double? height;
  final bool network;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.file(
        File(image),
        fit: BoxFit.cover,
        width: width,
        height: height,
        errorBuilder: (context, error, stackTrace) {
          if (network) {
            return CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              width: width,
              height: height,
              errorWidget: (context, url, error) {
                return Container();
              },
            );
          } else {
            return Image.asset(
              image,
              fit: BoxFit.cover,
              width: width,
              height: height,
            );
          }
        },
      ),
    );
  }
}
