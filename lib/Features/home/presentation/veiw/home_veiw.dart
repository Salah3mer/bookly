import 'package:bookly/core/utils/helper/widget/plend_widget.dart';
import 'package:bookly/Features/home/presentation/veiw/widget/home_veiw_body.dart';
import 'package:flutter/material.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          plend(-.79, -.68, Color(0xff09FBD3)),
          plend(.28, .8, Color(0xff08F7FE)),
          plend(.81, .12, Color(0xffFE53BB)),
          HomeVeiwBody(),
        ],
      ),
    );
  }
}
