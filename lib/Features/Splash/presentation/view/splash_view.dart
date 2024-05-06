import 'package:bookly/core/utils/helper/widget/plend_widget.dart';
import 'package:bookly/Features/Splash/presentation/view/widget/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: [
        plend(-.79, -.68, Color(0xff09FBD3)),
        plend(.28, .8, Color(0xff08F7FE)),
        plend(.81, .12, Color(0xffFE53BB)),
        SplashViewBody(),
      ],
    ));
  }
}
