import 'package:agro_mech/models/state/app_state.dart';
import 'package:agro_mech/models/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../common/navigation/route_name.dart';
import '../../../common/theme/app_colors.dart';
import '../../../cubits/app_cubit.dart';
import '../../../models/task/task.dart';
import 'custom_stepper.dart';
import 'start_form.dart';
import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';

// https://www.figma.com/file/dlOFTpqa0UdhqnVFrr4lXo/AgroCode-Hack-2023?type=design&node-id=3-118&mode=design&t=Lix5SUju198xPIEH-0
class BeginWork extends StatelessWidget {
  const BeginWork({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 60, top: 16),
            // color: Colors.pink.withOpacity(0.2),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.type.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(task.shortDescription),
                  const SizedBox(height: 20),
                  CustomStepper(
                    steps: task.steps,
                    seperatorColor: const Color(0xffD2D5DF),
                    isExpandable: true,
                    showStepStatusWidget: true,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              right: 12,
              left: 12,
              child: ElevatedButton(
                  onPressed: () {
                    context.read<AppCubit>().updateWork(Work.process);
                  },
                  child: Text('Приступить к работе')))
        ],
      ),
    );
  }
}
