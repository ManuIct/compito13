// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get helloWorld => 'Ciao Mondo';

  @override
  String get accedi => 'Accedi';

  @override
  String get username => 'Nome utente';

  @override
  String get entra => 'Entra';

  @override
  String get campoObbligatorio => 'Campo obbligatorio';

  @override
  String get titoloHome => 'Home';

  @override
  String benvenuto(String nome) {
    return 'Ciao $nome';
  }

  @override
  String get temaLabel => 'Tema';

  @override
  String get temaAutomatico => 'Auto';

  @override
  String get temaChiaro => 'Chiaro';

  @override
  String get temaScuro => 'Scuro';

  @override
  String get linguaLabel => 'Lingua';

  @override
  String get linguaAutomatica => 'Auto';

  @override
  String get esci => 'Esci';
}
