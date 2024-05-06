import 'package:bookly/core/utils/shimmer/shimmer_list_Item.dart';
import 'package:flutter/material.dart';

class ShimmerListPlaceHolder extends StatelessWidget {
  const ShimmerListPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => const ShimmerListViewItem(),
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
      ),
    );
  }
}
