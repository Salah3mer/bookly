import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBookImage extends StatelessWidget {
  final String imageUrl;
  const CustomBookImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fill,
      errorWidget: (context, url, error) => Image.network(
        'https://demofree.sirv.com/nope-not-here.jpg',
        fit: BoxFit.fill,
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[500]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
