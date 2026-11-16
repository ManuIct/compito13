import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:compito13/l10n/app_localizations.dart';

final preferenzeProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('Sovrascrivi preferenzeProvider'),
);

class TemaScelto extends Notifier<ThemeMode> {
  static const _chiave = 'tema';

  @override
  ThemeMode build() {
    final salvato = ref.read(preferenzeProvider).getString(_chiave);
    return ThemeMode.values.asNameMap()[salvato] ?? ThemeMode.system;
  }

  void cambia(ThemeMode modo) {
    state = modo;
    ref.read(preferenzeProvider).setString(_chiave, modo.name);
  }
}

final temaProvider = NotifierProvider<TemaScelto, ThemeMode>(TemaScelto.new);

class LinguaScelta extends Notifier<Locale?> {
  static const _chiave = 'lingua';

  @override
  Locale? build() {
    final codice = ref.read(preferenzeProvider).getString(_chiave);
    if (codice == null) return null;
    final locale = Locale(codice);
    final supportata = AppLocalizations.supportedLocales.any(
      (l) => l.languageCode == locale.languageCode,
    );
    return supportata ? locale : null;
  }

  void cambia(Locale? lingua) {
    state = lingua;
    final prefs = ref.read(preferenzeProvider);
    if (lingua == null) {
      prefs.remove(_chiave);
    } else {
      prefs.setString(_chiave, lingua.languageCode);
    }
  }
}

final linguaProvider =
    NotifierProvider<LinguaScelta, Locale?>(LinguaScelta.new);