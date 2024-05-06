import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContainerShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  const ContainerShimmer(
      {super.key, this.width, this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
      ),
    );
  }
}
