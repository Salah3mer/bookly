import 'package:bookly/core/theme/theme_Cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class plend extends StatelessWidget {
  final double x;
  final double y;
  final Color color;
  const plend(this.x, this.y, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      bool isDark = BlocProvider.of<ThemeCubit>(context).isDark;

      return isDark
          ? Container(
              decoration: BoxDecoration(
              gradient: RadialGradient(
                  radius: .8,
                  stops: const [0, 1],
                  center: Alignment(x, y),
                  colors: [
                    color.withOpacity(.2),
                    color.withOpacity(.0),
                  ]),
            ))
          : const SizedBox();
    });
  }
}
