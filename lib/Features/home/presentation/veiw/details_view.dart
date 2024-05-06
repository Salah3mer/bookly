import 'package:bookly/core/utils/helper/widget/plend_widget.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/veiw/widget/book_details_view_body.dart';
import 'package:bookly/core/utils/helper/url_luncher.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final BookModel bookModel;
  const DetailsView({
    super.key,
    required this.bookModel,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const plend(-.79, -.68, Color(0xff09FBD3)),
            const plend(.28, .8, Color(0xffFE53BB)),
            const plend(.81, .12, Color(0xffFE53BB)),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: BookDetailsViewBody(
                        width: width,
                        book: bookModel,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 60,
                          width: width / 2 - 20,
                          child: ElevatedButton(
                            onPressed: () {
                              launchCustomUr(
                                  context, bookModel.volumeInfo?.previewLink);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffD45555),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'Read Previews',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: width / 2 - 20,
                          child: ElevatedButton(
                            onPressed: () {
                              if (bookModel.accessInfo!.pdf!.acsTokenLink !=
                                  null) {
                                launchCustomUr(
                                    context,
                                    bookModel.accessInfo!.pdf?.acsTokenLink
                                        ?.replaceFirst('http', 'https'));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Cannot launch Url')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'Download',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
