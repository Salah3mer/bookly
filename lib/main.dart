import 'package:bookly/Features/home/data/repoes/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/cubits/featchBooksByType/featch_books_by_type_cubit.dart';
import 'package:bookly/Features/home/presentation/cubits/newArrivalsBookCubit/new_arrivals_book_cubit.dart';
import 'package:bookly/constans.dart';
import 'package:bookly/core/service_Locator/service_locator.dart';
import 'package:bookly/core/theme/dark_theme.dart';
import 'package:bookly/core/theme/light_theme.dart';
import 'package:bookly/core/theme/theme_Cubit/theme_cubit.dart';
import 'package:bookly/core/utils/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(context) {
  setupServiceLocator();
  runApp(const Bookly());
  bool isDark = BlocProvider.of<ThemeCubit>(context).isDark;
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatchBooksByTypeCubit(getIt.get<HomeRepoImpl>())
            ..featchBooksByType(type: 'novel'),
        ),
        BlocProvider(
          create: (context) => NewArrivalsBookCubit(
            getIt.get<HomeRepoImpl>(),
          )..getNewArrivalsBook(),
        ),
        BlocProvider(create: (context) => ThemeCubit()..changeTheme())
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.onGeneratedRoute,
            initialRoute: Routes.initalRoute,
            theme: BlocProvider.of<ThemeCubit>(context).isDark
                ? DarkTheme()
                : LightTheme(),
          );
        },
      ),
    );
  }
}
