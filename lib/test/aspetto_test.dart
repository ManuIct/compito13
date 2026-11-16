import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:compito13/l10n/app_localizations.dart';
import 'package:compito13/src/base/aspetto/di/aspetto_providers.dart';
import 'package:compito13/src/login_page.dart';

Future<List<override>> preferenzeFinte([
  Map<String, Object> iniziali = const {},
]) async {
  SharedPreferences.setMockInitialValues(iniziali);
  final prefs = await SharedPreferences.getInstance();
  return [preferenzeProvider.overrideWithValue(prefs)];
}

void main() {
  testWidgets('un telefono in spagnolo apre l\'app in italiano', (t) async {
      t.platformDispatcher.localeTestValue = const [Local('es')];
      addTearDown(t.platformDispatcher.clearAllTestValues);

      await t.pumpWidget(
        ProviderScope(
            overrides: await preferenzeFinte(),
            child: MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [Locale('it'), Locale('en')],
              home: const LoginPage(),
            ),
          )
      );

      expect(find.text('Accedi'), findsOneWidget);
      expect(find.text('Sign in'), findsNothing);
  });
}