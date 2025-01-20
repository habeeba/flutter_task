import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/navigation/routes/route.dart';
import 'core/service_locator/injector.dart' as di;
import 'core/utils/shared_preference.dart';
import 'features/my_app.dart';
import 'features/my_bloc_observer.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreference.init();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = MyBlocObserver();
  di.init();

  // final appLanguage = MySharedPreference.getData(key: 'appLanguage');
  // final systemLocal = appLanguage ?? Platform.localeName.split('_')[0];

  await Future.delayed(
    const Duration(milliseconds: 400),
    () {
      runApp(
        EasyLocalization(
            supportedLocales: const [Locale("en")],
            path: "assets/lang",
            fallbackLocale: const Locale("en"),
            startLocale: const Locale("en"),
            child: MyApp(
              appRoute: AppRoute(),
            ),
          ),
      );
    },
  );
}
