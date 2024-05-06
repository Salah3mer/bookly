import 'package:bookly/core/utils/shimmer/container_shimmer.dart';
import 'package:flutter/cupertino.dart';

class ShimmerListViewItem extends StatelessWidget {
  const ShimmerListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 2.7 / 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: ContainerShimmer(
              borderRadius: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerShimmer(
                  height: 10,
                  width: 150,
                ),
                SizedBox(
                  height: 5,
                ),
                ContainerShimmer(
                  height: 10,
                  width: 90,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
