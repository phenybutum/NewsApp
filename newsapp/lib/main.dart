import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/presentation/app.dart';

void main() {
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ua', 'UA'),
      ],
      path: 'assets/languages',
      child: App()));
}

