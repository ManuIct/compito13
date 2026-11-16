import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:compito13/l10n/app_localizations.dart';
import 'package:compito13/src/base/aspetto/di/aspetto_providers.dart';

class HomePage extends ConsumerWidget {
  // ① 👇 il nome arriva dal login (è un dato, non una frase)
  const HomePage({super.key, required this.nome});

  final String nome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final tema = ref.watch(temaProvider);
    final lingua = ref.watch(linguaProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.titoloHome)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.benvenuto(nome),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),

            Text(l10n.temaLabel),
            const SizedBox(height: 8),
            // ② 👇 3 valori = 3 stati: «Auto» è un valore, non un'assenza
            SegmentedButton<ThemeMode>(
              segments: [
                ButtonSegment(
                  value: ThemeMode.system,
                  label: Text(l10n.temaAutomatico),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  label: Text(l10n.temaChiaro),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  label: Text(l10n.temaScuro),
                ),
              ],
              selected: {tema},
              onSelectionChanged: (s) =>
                  ref.read(temaProvider.notifier).cambia(s.first),
            ),
            const SizedBox(height: 24),

            Text(l10n.linguaLabel),
            const SizedBox(height: 8),
            // ③ 👇 null = «segui il telefono» (cancella la chiave salvata)
            SegmentedButton<Locale?>(
              segments: [
                ButtonSegment(
                  value: null,
                  label: Text(l10n.linguaAutomatica),
                ),
                const ButtonSegment(value: Locale('it'), label: Text('IT')),
                const ButtonSegment(value: Locale('en'), label: Text('EN')),
              ],
              selected: {lingua},
              onSelectionChanged: (s) =>
                  ref.read(linguaProvider.notifier).cambia(s.first),
            ),
            const Spacer(),

            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.esci),
            ),
          ],
        ),
      ),
    );
  }
}