import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CodeField extends HookWidget {
  CodeField({Key? key, required this.fieldKey}) : super(key: key);

  final GlobalKey<FormFieldState> fieldKey;

  @override
  Widget build(BuildContext context) => Focus(
        child: TextFormField(
          key: fieldKey,
          validator: (String? code) {
            if (code == null ||
                code.length != 6 ||
                !RegExp(r'^\d{6}$').hasMatch(code)) {
              return 'Code must be exactly 6 digits';
            }
            return null;
          },
          autofillHints: const [AutofillHints.oneTimeCode],
          decoration: const InputDecoration(
            labelText: 'Code',
            // An empty helperText prevents field from changing height
            // when an error is shown:
            helperText: '',
            prefixIcon: Icon(Icons.security),
          ),
        ),
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            fieldKey.currentState!.validate();
          }
        },
      );
}
