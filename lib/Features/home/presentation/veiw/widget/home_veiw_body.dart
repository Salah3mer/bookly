import 'package:bookly/Features/home/presentation/veiw/widget/app_bar_veiw.dart';
import 'package:bookly/Features/home/presentation/veiw/widget/custom_tab.dart';
import 'package:bookly/core/utils/helper/widget/custom_textformfeild.dart';
import 'package:bookly/Features/home/presentation/veiw/widget/new_arrivals_grid_view.dart';
import 'package:bookly/core/utils/routes/app_route.dart';
import 'package:flutter/material.dart';

class HomeVeiwBody extends StatelessWidget {
  const HomeVeiwBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AppBarVeiw(),
                Text(
                  'Welcome back, Bunny!',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                      ),
                ),
                Text(
                  'What do you want to \n read today?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                CustomTextFormFeild(
                  readOnly: true,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.searchView);
                  },
                ),
                const CustomTabWithBody(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, bottom: 15),
                  child: Text(
                    'New Arrivals',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: NewArrivalsGridView(),
          ),
        ],
      ),
    );
  }
}
