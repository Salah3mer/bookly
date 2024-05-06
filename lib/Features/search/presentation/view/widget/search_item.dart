import 'package:bookly/core/utils/helper/widget/custom_rating_widget.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/helper/widget/custom_book_Image.dart';
import 'package:flutter/material.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomBookImage(
                  imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? ''),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      book.volumeInfo!.title ?? 'Title Not Found',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      book.volumeInfo!.authors!.join(' , '),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Free',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                        CustomRatingWidget(
                          size: 5,
                          rating: book.volumeInfo!.averageRating ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
