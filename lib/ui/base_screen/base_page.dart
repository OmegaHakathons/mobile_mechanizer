import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/theme/app_colors.dart';
import '../../cubits/app_cubit.dart';
import '../../models/app_tabs.dart';
import '../../models/state/app_state.dart';
import '../../services/https_service.dart';
import '../calendar_screen/calendar_page.dart';
import '../profile_screen/profile_page.dart';
import '../work_screen/work_page.dart';

class BottomItem {
  final IconData icon;
  final String label;
  const BottomItem({
    required this.icon,
    required this.label,
  });
}

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  final _bottomItems = const [
    BottomItem(icon: Icons.calendar_today, label: 'Календарь'),
    BottomItem(icon: Icons.work, label: 'Задача'),
    BottomItem(icon: Icons.stacked_line_chart_rounded, label: 'Отчёт'),
  ];

  @override
  Widget build(BuildContext context) {
    HttpsService().getTasks().then((value) {
      log(value.toString());
    });
    log('перестраиваем base');
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        int currentIndex = AppTabs.values.indexOf(state.currentTab);
        return Scaffold(
          body: state.currentTab == AppTabs.work
              ? const WorkPage()
              : state.currentTab == AppTabs.calendar
                  ? const CalendarPage()
                  : const ProfilePage(),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    _bottomItems.length,
                    (index) => Expanded(
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<AppCubit>(context)
                                  .updateTab(AppTabs.values[index]);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _bottomItems[index].icon,
                                  color: currentIndex == index
                                      ? AppColors.black
                                      : AppColors.greyDark,
                                ),
                                Text(
                                  _bottomItems[index].label,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: currentIndex == index
                                              ? AppColors.black
                                              : AppColors.greyDark),
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
          ),
        );
      },
    );
  }
}
