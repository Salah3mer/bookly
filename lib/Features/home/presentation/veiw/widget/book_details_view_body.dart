import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/veiw/widget/custom_details_appbar.dart';
import 'package:bookly/Features/home/presentation/veiw/widget/custom_details_image.dart';
import 'package:bookly/core/utils/helper/widget/custom_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel book;
  const BookDetailsViewBody({
    super.key,
    required this.width,
    required this.book,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .15,
          ),
          child: CustomDetailsImage(
            imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? '',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                book.volumeInfo!.title!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                book.volumeInfo!.authors![0],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              CustomRatingWidget(
                rating: book.volumeInfo?.averageRating ?? 0,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About the author',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              book.volumeInfo!.authors!.join(','),
              style: const TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              book.volumeInfo!.description ?? '',
              style: const TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        )
      ],
    );
  }
}
