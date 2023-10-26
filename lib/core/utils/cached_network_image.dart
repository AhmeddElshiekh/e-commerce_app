import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl:imageUrl ,
      placeholder: (context, url) =>
      const Center(
          child:
          CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
      const Icon(Icons.error),
    );
  }
}