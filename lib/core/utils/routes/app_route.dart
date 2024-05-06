import 'package:bookly/Features/Splash/presentation/view/splash_view.dart';

import 'package:bookly/Features/home/presentation/veiw/home_veiw.dart';
import 'package:bookly/Features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initalRoute = '/';
  static const String homeView = '/homeView';
  static const String detailsView = '/detailsView';
  static const String searchView = '/searchView';
}

class AppRoutes {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initalRoute:
        return MaterialPageRoute(builder: ((context) => const SplashView()));
      case Routes.homeView:
        return MaterialPageRoute(builder: ((context) => const HomeVeiw()));
      // case Routes.detailsView:
      //   return MaterialPageRoute(
      //       // ignore: prefer_const_constructors
      //     builder: ((context) => DetailsView(bookModel: )));
      case Routes.searchView:
        return MaterialPageRoute(builder: ((context) => const SearchVeiw()));
      default:
        return onRouteError();
    }
  }

  static Route<dynamic> onRouteError() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text('No Route Found'),
              ),
            )));
  }
}
