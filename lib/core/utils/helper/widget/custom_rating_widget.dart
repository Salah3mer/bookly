import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class CustomRatingWidget extends StatelessWidget {
  final dynamic rating;
  double size;
  CustomRatingWidget({super.key, this.rating, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmoothStarRating(
          rating: rating.toDouble(),
          size: size,
          color: Colors.amber,
          spacing: 2,
          starCount: 5,
          borderColor: Theme.of(context).disabledColor,
          filledIconData: FontAwesomeIcons.solidStar,
          allowHalfRating: true,
          halfFilledIconData: FontAwesomeIcons.starHalfStroke,
          defaultIconData: FontAwesomeIcons.star,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(rating.toString()),
      ],
    );
  }
}
