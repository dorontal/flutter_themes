import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'constants/theme_data.dart';
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
    final _formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme playground'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: <Widget>[
            const EmailField(),
            PasswordField(),
            const CodeField(),
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
          dev.log('Valid form?: ${_formKey.currentState!.validate()}');
        },
        tooltip: 'Check validity',
        child: const Icon(Icons.check),
      ),
    );
  }
}
