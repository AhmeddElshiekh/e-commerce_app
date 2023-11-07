import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.imageUrl, this.boxFit});
  final String imageUrl;
  final BoxFit? boxFit ;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit ?? BoxFit.contain,
      imageUrl:imageUrl ,
      height: MediaQuery.of(context).size.height *.2,
      width: MediaQuery.of(context).size.width ,
      placeholder: (context, url) =>
      const Center(
          child:
          CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
      const Icon(Icons.error),
    );
  }
}
