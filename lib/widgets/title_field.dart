import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TitleField extends HookWidget {
  const TitleField({Key? key, required this.fieldKey}) : super(key: key);

  final GlobalKey<FormFieldState> fieldKey;

  @override
  Widget build(BuildContext context) => Focus(
        child: TextFormField(
          key: fieldKey,
          validator: (String? title) {
            if (title == null || title.length < 2) {
              return 'Title must have at least 2 characters';
            } else if (title.length >= 100) {
              return 'Title must have less than 100 characters';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Title',
            // An empty helperText prevents field from changing height
            // when an error is shown:
            helperText: '',
          ),
        ),
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            fieldKey.currentState!.validate();
          }
        },
      );
}
