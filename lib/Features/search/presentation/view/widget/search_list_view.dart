import 'package:bookly/Features/home/presentation/veiw/details_view.dart';
import 'package:bookly/core/utils/shimmer/simmer_list.dart';
import 'package:bookly/Features/search/presentation/cubit/cubit/search_cubit.dart';
import 'package:bookly/Features/search/presentation/view/widget/search_item.dart';
import 'package:bookly/core/utils/routes/app_route.dart';
import 'package:bookly/core/utils/shimmer/search_list_view_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccessState) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          itemCount: state.books.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsView(bookModel: state.books[index])));
            },
            child: SearchListViewItem(
              book: state.books[index],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 15.0),
        );
      } else if (state is SearchErrorState) {
        return Center(child: Text(state.error));
      } else if (state is SearchLoadingState) {
        return const SearchListShimmer();
      } else {
        return Container();
      }
    });
  }
}
