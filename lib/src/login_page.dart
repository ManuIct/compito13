import 'package:flutter/material.dart';
import 'package:compito13/l10n/app_localizations.dart';
import 'package:compito13/src/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  bool _tentato = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.accedi)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: l10n.username,
                  border: const OutlineInputBorder(),
                ),
                autovalidateMode: _tentato
                    ? AutovalidateMode.always
                    : AutovalidateMode.onUserInteraction,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? l10n.campoObbligatorio
                    : null,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  setState(() => _tentato = true);
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            HomePage(nome: _nomeController.text.trim()),
                      ),
                    );
                  }
                },
                child: Text(l10n.entra),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
