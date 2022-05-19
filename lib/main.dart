import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_themes/widgets/titled_border.dart';

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
      home: const FormPage(),
    );
  }
}

class FormPage extends HookWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailFieldKey = useMemoized(() => GlobalKey<FormFieldState>());
    final passwordFieldKey = useMemoized(() => GlobalKey<FormFieldState>());
    final codeFieldKey = useMemoized(() => GlobalKey<FormFieldState>());
    final titleFieldKey = useMemoized(() => GlobalKey<FormFieldState>());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme playground'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: <Widget>[
            EmailField(fieldKey: emailFieldKey),
            PasswordField(fieldKey: passwordFieldKey),
            CodeField(fieldKey: codeFieldKey),
            TitleField(fieldKey: titleFieldKey),
            const TitledBorder(
              title: 'Titled Border',
              child: Text(
                'Title not, instead it is the text inside',
                style: TextStyle(fontSize: 16),
              ),
            ),
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
          final _valid = formKey.currentState!.validate();
          dev.log('Valid form?: $_valid');
          dev.log('email: ${emailFieldKey.currentState!.value}');
          dev.log('password: ${passwordFieldKey.currentState!.value}');
          dev.log('code: ${codeFieldKey.currentState!.value}');
          dev.log('title: ${titleFieldKey.currentState!.value}');
        },
        tooltip: 'Check validity',
        child: const Icon(Icons.check),
      ),
    );
  }
}
