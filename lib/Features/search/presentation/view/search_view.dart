import 'package:bookly/core/utils/helper/widget/plend_widget.dart';
import 'package:bookly/Features/search/data/repo/search_repo_impl.dart';
import 'package:bookly/Features/search/presentation/cubit/cubit/search_cubit.dart';
import 'package:bookly/Features/search/presentation/view/widget/search_view_body.dart';
import 'package:bookly/core/service_Locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchVeiw extends StatelessWidget {
  const SearchVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: const Scaffold(
        body: Stack(
          children: [
            plend(-.79, -.68, Color(0xff09FBD3)),
            plend(.28, .8, Color(0xff08F7FE)),
            plend(.81, .12, Color(0xffFE53BB)),
            SearchViewBody(),
          ],
        ),
      ),
    );
  }
}
