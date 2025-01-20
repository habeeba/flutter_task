import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/navigation/navigator_service/navigator_service.dart';
import '../core/navigation/routes/route.dart';
import '../core/utils/app_theme.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key, required AppRoute appRoute});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      navigatorKey: AppNavigator.navigatorKey,
      theme: AppTheme.light(context),
      darkTheme: AppTheme.dark(context),
      initialRoute: "/items",
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
