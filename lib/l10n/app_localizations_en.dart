// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World';

  @override
  String get accedi => 'Sign in';

  @override
  String get username => 'Username';

  @override
  String get entra => 'Sign in';

  @override
  String get campoObbligatorio => 'Required field';

  @override
  String get titoloHome => 'Home';

  @override
  String benvenuto(String nome) {
    return 'Hello $nome';
  }

  @override
  String get temaLabel => 'Theme';

  @override
  String get temaAutomatico => 'Auto';

  @override
  String get temaChiaro => 'Light';

  @override
  String get temaScuro => 'Dark';

  @override
  String get linguaLabel => 'Language';

  @override
  String get linguaAutomatica => 'Auto';

  @override
  String get esci => 'Sign out';
}
