import 'package:bookly/Features/search/presentation/cubit/cubit/search_cubit.dart';
import 'package:bookly/Features/search/presentation/view/widget/search_app_bar.dart';
import 'package:bookly/Features/search/presentation/view/widget/search_list_view.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/helper/widget/custom_textformfeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchAppBar(),
          CustomTextFormFeild(
            controller: BlocProvider.of<SearchCubit>(context).searchController,
            onCahange: (val) {
              if (BlocProvider.of<SearchCubit>(context)
                  .searchController
                  .text
                  .isNotEmpty) {
                BlocProvider.of<SearchCubit>(context)
                    .searchingForBooks(name: val);
              }
            },
            onComplet: () {
              if (BlocProvider.of<SearchCubit>(context)
                  .searchController
                  .text
                  .isNotEmpty) {
                BlocProvider.of<SearchCubit>(context).searchingForBooks(
                    name: BlocProvider.of<SearchCubit>(context)
                        .searchController
                        .text);
              }
            },
          ),
          const Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}
