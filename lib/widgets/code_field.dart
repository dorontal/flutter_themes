import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CodeField extends HookWidget {
  const CodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final codeFieldKey = GlobalKey<FormFieldState>();

    return Focus(
      child: TextFormField(
        key: codeFieldKey,
        validator: _validateCode,
        autofillHints: const [AutofillHints.oneTimeCode],
        decoration: const InputDecoration(
          labelText: 'Code',
          // An empty helperText prevents field from changing height
          // when an error is shown:
          helperText: '',
          prefixIcon: Icon(Icons.code),
        ),
      ),
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          codeFieldKey.currentState!.validate();
        }
      },
    );
  }
}

String? _validateCode(String? code) {
  const String invalidMessage01 = 'Code must be exactly 6 digits';
  const String invalidMessage02 = 'Code can\'t be empty';

  if (code == null || code.isEmpty) {
    // dev.log('validatecode(null)');
    return invalidMessage02;
  } else {
    // dev.log('validatecode($code)');
  }

  if (code.length < 6) {
    return invalidMessage01;
  }
  if (!RegExp(r'^\d{6}$').hasMatch(code)) {
    return invalidMessage01;
  }

  return null;
}
