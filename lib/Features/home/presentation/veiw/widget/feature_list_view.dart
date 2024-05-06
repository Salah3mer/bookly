import 'package:bookly/Features/home/presentation/cubits/featchBooksByType/featch_books_by_type_cubit.dart';
import 'package:bookly/Features/home/presentation/veiw/widget/custom_list_item.dart';
import 'package:bookly/core/utils/shimmer/simmer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureListView extends StatelessWidget {
  const FeatureListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatchBooksByTypeCubit, FeatchBooksByTypeState>(
        builder: (context, state) {
      if (state is FeatchBooksByTypeSucessState) {
        return ListView.builder(
          itemCount: state.books.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: CustomListItem(
              book: state.books[index],
            ),
          ),
        );
      } else if (state is FeatchBooksByTypeErrorState) {
        return Center(
          child: Text(state.error),
        );
      } else {
        return const ShimmerListPlaceHolder();
      }
    });
  }
}
