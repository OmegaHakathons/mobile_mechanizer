import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_tabs.dart';
import '../work.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(AppTabs.work) AppTabs currentTab,
    @Default(Work.none) Work currentWork,
    @Default(true) bool isConnection,
    @Default(false) bool isAuthorized,
  }) = _AppState;
}
