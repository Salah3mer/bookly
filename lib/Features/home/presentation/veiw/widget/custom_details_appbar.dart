import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          FontAwesomeIcons.arrowLeft,
          color: Theme.of(context).primaryIconTheme.color,
          size: 25,
        ));
  }
}
