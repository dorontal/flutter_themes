import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'constants/theme_data.dart';
import 'widgets/about_field.dart';
import 'widgets/code_field.dart';
import 'widgets/email_field.dart';
import 'widgets/password_field.dart';

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
    final emailGlobalKey = useMemoized(() => GlobalKey<FormFieldState>());
    final passwordGlobalKey = useMemoized(() => GlobalKey<FormFieldState>());
    final codeGlobalKey = useMemoized(() => GlobalKey<FormFieldState>());
    final aboutGlobalKey = useMemoized(() => GlobalKey<FormFieldState>());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme playground'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: <Widget>[
            EmailField(globalKey: emailGlobalKey),
            PasswordField(globalKey: passwordGlobalKey),
            CodeField(globalKey: codeGlobalKey),
            AboutField(globalKey: aboutGlobalKey),
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
          final formIsValid = formKey.currentState!.validate();
          dev.log('Valid form?: $formIsValid');
          dev.log('email: ${emailGlobalKey.currentState!.value}');
          dev.log('password: ${passwordGlobalKey.currentState!.value}');
          dev.log('code: ${codeGlobalKey.currentState!.value}');
          dev.log('title: ${aboutGlobalKey.currentState!.value}');
        },
        tooltip: 'Check validity',
        child: const Icon(Icons.check),
      ),
    );
  }
}
