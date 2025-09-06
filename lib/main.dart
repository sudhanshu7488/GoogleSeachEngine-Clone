import 'package:flutter/material.dart';
import 'package:google_ex/googlscreen.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      // ignore: sort_child_properties_last
      child: const MyApp(),
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('bn'),
        Locale('gu'),
        Locale('kn'),
        Locale('mr'),
        Locale('pa'),
        Locale('ta'),
        Locale('te'),
        Locale('ml')
      ],
      path: '../lib/assets/translations',
      fallbackLocale: Locale('en'),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: GoogleSCreen(),
    );
  }
}
