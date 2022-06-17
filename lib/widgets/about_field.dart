import 'package:flutter/material.dart';

class AboutField extends StatelessWidget {
  const AboutField({Key? key, required this.fieldKey}) : super(key: key);

  final GlobalKey<FormFieldState> fieldKey;

  @override
  Widget build(BuildContext context) => Focus(
        child: TextFormField(
          key: fieldKey,
          maxLines: 5,
          validator: (String? about) {
            if (about == null || about.length < 2) {
              return 'About must have at least 2 characters';
            } else if (about.length >= 100) {
              return 'About must have less than 100 characters';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'About',
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
