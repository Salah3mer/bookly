import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/veiw/details_view.dart';
import 'package:bookly/core/utils/helper/widget/custom_book_Image.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final BookModel book;
  const CustomListItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => DetailsView(bookModel: book))));
      },
      child: AspectRatio(
        aspectRatio: 2.7 / 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                      color: Colors.grey[500],
                      child: CustomBookImage(
                        imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? '',
                      )),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.volumeInfo!.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      book.volumeInfo!.authors!.join(' , '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                          ),
                    )
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
