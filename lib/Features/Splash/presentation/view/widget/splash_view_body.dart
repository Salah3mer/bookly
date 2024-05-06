import 'package:bookly/Features/Splash/presentation/view/widget/sliding_text.dart';
import 'package:bookly/core/utils/routes/app_route.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slaidingAnimation;
  @override
  void initState() {
    super.initState();
    initAnimation();
    navgateToHome(context);
  }

  void navgateToHome(context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.homeView);
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AssetsData.logo,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 5,
            ),
            SlidingText(slaidingAnimation: slaidingAnimation),
          ]),
    );
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slaidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
