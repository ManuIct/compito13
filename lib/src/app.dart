import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:compito13/l10n/app_localizations.dart';
import 'package:compito13/src/base/aspetto/di/aspetto_providers.dart';
import 'package:compito13/src/login_page.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      themeMode: ref.watch(temaProvider),
      locale: ref.watch(linguaProvider),
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [Locale('it'), Locale('en')],

      home: const LoginPage(),
    );
  }
}