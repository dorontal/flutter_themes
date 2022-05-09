import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'constants/theme_data.dart';
import 'widgets/code_field.dart';
import 'widgets/email_field.dart';
import 'widgets/password_field.dart';
import 'widgets/title_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: FormPage(),
    );
  }
}

class FormPage extends HookWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final _emailFieldKey = useMemoized(() => GlobalKey<FormFieldState>());
    final _passwordFieldKey = useMemoized(() => GlobalKey<FormFieldState>());
    final _codeFieldKey = useMemoized(() => GlobalKey<FormFieldState>());
    final _titleFieldKey = useMemoized(() => GlobalKey<FormFieldState>());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme playground'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: <Widget>[
            EmailField(fieldKey: _emailFieldKey),
            PasswordField(fieldKey: _passwordFieldKey),
            CodeField(fieldKey: _codeFieldKey),
            TitleField(fieldKey: _titleFieldKey),
          ]
              .map((child) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: child,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final _valid = _formKey.currentState!.validate();
          dev.log('Valid form?: $_valid');
          dev.log('email: ${_emailFieldKey.currentState!.value}');
          dev.log('password: ${_passwordFieldKey.currentState!.value}');
          dev.log('code: ${_codeFieldKey.currentState!.value}');
          dev.log('title: ${_titleFieldKey.currentState!.value}');
        },
        tooltip: 'Check validity',
        child: const Icon(Icons.check),
      ),
    );
  }
}
