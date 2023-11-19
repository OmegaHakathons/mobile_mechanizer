import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/navigation/router.dart';
import '../common/theme/light_theme.dart';
import '../cubits/calendar_cubit.dart';
import '../cubits/pin_auth_cubit.dart';
import '../cubits/app_cubit.dart';
import '../cubits/task_cubit.dart';
import '../services/reachability_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  // const App({super.key, required CardRepository cardRepository})
  //     : _cardRepository = cardRepository;
  // final CardRepository _cardRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (_) => AppCubit(
            ReachabilityService(),
            // Repository(),
          )..listenToConnectivity(),
        ),
        BlocProvider<PinAuthCubit>(
          create: (_) => PinAuthCubit(),
        ),
        BlocProvider<CalendarCubit>(
          create: (_) => CalendarCubit(),
        ),
        BlocProvider<TaskCubit>(
          create: (_) => TaskCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Механизатор',
        theme: themeLight,
        routerConfig: router,
      ),
    );
  }
}
