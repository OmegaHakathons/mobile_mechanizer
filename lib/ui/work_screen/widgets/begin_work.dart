import 'package:agro_mech/models/app_tabs.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Поле: ${task.field}'),
        Text('Техника: ${task.car?.name}'),
        Text('Агрегат: ${task.aggregate?.name}'),
        Text(
            'Дата выполнения: ${DateFormat('dd MMMM, EEEE', 'ru').format(task.deadline)}'),
      ],
    );
  }
}
