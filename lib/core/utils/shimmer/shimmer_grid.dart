import 'package:bookly/core/utils/shimmer/shimmer_list_Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShimmerGridPlaceHolder extends StatelessWidget {
  const ShimmerGridPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.7 / 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 0,
      ),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ShimmerListViewItem();
      },
    );
  }
}
