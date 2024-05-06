import 'package:bookly/core/theme/theme_Cubit/theme_cubit.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarVeiw extends StatelessWidget {
  const AppBarVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Image.asset(
              AssetsData.logo,
              height: 25,
            ),
            const Spacer(),
            SizedBox(
              width: 75,
              child: DayNightSwitcher(
                isDarkModeEnabled: true,
                onStateChanged: (value) {
                  BlocProvider.of<ThemeCubit>(context).changeTheme();
                },
              ),
            ),
          ],
        ));
  }
}
