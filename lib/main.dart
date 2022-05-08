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

  final _formKey = GlobalKey<FormState>();
  final _emailFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Theme playground'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(32),
            children: <Widget>[
              EmailField(fieldKey: _emailFieldKey),
              PasswordField(),
              CodeField(),
              TitleField(),
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
          },
          tooltip: 'Check validity',
          child: const Icon(Icons.check),
        ),
      );
}
