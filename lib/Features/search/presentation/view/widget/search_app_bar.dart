import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(FontAwesomeIcons.arrowLeft)),
        const SizedBox(width: 90),
        Image.asset(
          AssetsData.logo,
          height: 30,
        ),
      ],
    );
  }
}
