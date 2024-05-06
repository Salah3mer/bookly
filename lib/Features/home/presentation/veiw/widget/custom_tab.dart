import 'package:bookly/Features/home/presentation/cubits/featchBooksByType/featch_books_by_type_cubit.dart';
import 'package:bookly/Features/home/presentation/veiw/widget/feature_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabWithBody extends StatelessWidget {
  const CustomTabWithBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: TabBar(
                  labelColor: Theme.of(context).tabBarTheme.labelColor,
                  unselectedLabelColor:
                      Theme.of(context).tabBarTheme.unselectedLabelColor,
                  indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 10),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  onTap: (value) {
                    switch (value) {
                      case 0:
                        BlocProvider.of<FeatchBooksByTypeCubit>(context)
                            .featchBooksByType(type: 'novels');
                      case 1:
                        BlocProvider.of<FeatchBooksByTypeCubit>(context)
                            .featchBooksByType(type: 'self-love');
                      case 2:
                        BlocProvider.of<FeatchBooksByTypeCubit>(context)
                            .featchBooksByType(type: 'science');
                      case 3:
                        BlocProvider.of<FeatchBooksByTypeCubit>(context)
                            .featchBooksByType(type: 'romance');
                      case 4:
                        BlocProvider.of<FeatchBooksByTypeCubit>(context)
                            .featchBooksByType(type: 'crime');
                    }
                  },
                  tabs: const [
                    Tab(
                      child: Text('Novel'),
                    ),
                    Tab(
                      child: Text('Self-Love'),
                    ),
                    Tab(
                      child: Text('Science'),
                    ),
                    Tab(
                      child: Text('Romance'),
                    ),
                    Tab(
                      child: Text('Crime'),
                    ),
                  ]),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TabBarView(children: [
                  FeatureListView(),
                  FeatureListView(),
                  FeatureListView(),
                  FeatureListView(),
                  FeatureListView(),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
