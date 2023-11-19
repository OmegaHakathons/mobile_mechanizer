import 'package:agro_mech/services/repository.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:nfc_classic_mifare/nfc_classic_mifare.dart';

import 'common/di.dart';
import 'services/Https_debug_support/my_http_overrides.dart';
import 'services/crypto_service.dart';
import 'services/local_storage.dart';
import 'ui/app.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Locator.init();
  initializeDateFormatting('ru');

  // remove httpOverrides on production
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await CryptoService().initialize();
  await Hive.initFlutter();
  // final repository = await LocalStorage().initialiseHive();
  final cardRepo = await initialiseHive();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Repository().initialize();
  Repository().cardRepository = cardRepo;
  // Repository().startGettingRegistr();

  runApp(const App());
}
