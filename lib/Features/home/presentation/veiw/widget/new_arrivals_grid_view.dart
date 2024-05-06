import 'package:bookly/Features/home/presentation/cubits/newArrivalsBookCubit/new_arrivals_book_cubit.dart';
import 'package:bookly/Features/home/presentation/veiw/widget/custom_list_item.dart';
import 'package:bookly/core/utils/shimmer/shimmer_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewArrivalsGridView extends StatelessWidget {
  const NewArrivalsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewArrivalsBookCubit, NewArrivalsBookState>(
        builder: (context, state) {
      if (state is NewArrivalsBookSucessState) {
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
          itemBuilder: (context, index) => CustomListItem(
            book: state.book[index],
          ),
          itemCount: state.book.length,
        );
      } else if (state is NewArrivalsBookErrorState) {
        return Center(
          child: Text(state.error),
        );
      } else {
        return const ShimmerGridPlaceHolder();
      }
    });
  }
}
