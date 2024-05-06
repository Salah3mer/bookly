import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDetailsImage extends StatelessWidget {
  final String? imageUrl;
  const CustomDetailsImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.7 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Center(
                child: Icon(
              FontAwesomeIcons.circleExclamation,
              color: Colors.redAccent,
            )),
          ),
        ));
  }
}
