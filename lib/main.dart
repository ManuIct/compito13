import 'package:compito13/src/base/aspetto/di/aspetto_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:compito13/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();


  runApp(
    ProviderScope(
      overrides: [preferenzeProvider.overrideWithValue(prefs)],
      child: const App(),
    )
  );
}