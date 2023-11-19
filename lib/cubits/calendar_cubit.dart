import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/utils.dart';
import '../models/state/calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
      : super(CalendarState(selectedDate: getYearMonthDay(DateTime.now())));

  void updateDate(DateTime newDay) {
    emit(state.copyWith(selectedDate: getYearMonthDay(newDay)));
  }
}
