import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:media_dictionary/bindings/main_bindings.dart';
import 'package:media_dictionary/core/theme/app_theme.dart';
import 'package:media_dictionary/routes/app_pages.dart';
import 'package:media_dictionary/routes/app_routes.dart';
import 'package:media_dictionary/translations/app_translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: GetMaterialApp(
        title: 'Media Dictionary',
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        initialBinding: MainBindings(),
        initialRoute: Routes.initial,
        getPages: AppPages.pages,
        locale: const Locale('uz'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        translationsKeys: AppTranslations.translations,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 100),
      ),
    );
  }
}
