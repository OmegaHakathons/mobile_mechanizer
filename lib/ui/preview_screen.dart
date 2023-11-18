import 'package:flutter/material.dart';

import '../models/task/task.dart';
import 'work_screen/widgets/begin_work.dart';

class PreviewTask extends StatelessWidget {
  const PreviewTask({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BeginWork(
        task: task,
      ),
    );
  }
}
