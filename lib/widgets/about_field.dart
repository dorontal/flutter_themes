import 'package:flutter/material.dart';

class AboutField extends StatelessWidget {
  const AboutField({Key? key, required this.fieldKey}) : super(key: key);

  final GlobalKey<FormFieldState> fieldKey;

  @override
  Widget build(BuildContext context) => Focus(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            key: fieldKey,
            maxLines: 5,
            validator: (String? about) {
              if (about == null || about.length > 1024) {
                return 'About must have 1024 characters or less';
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
        ),
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            fieldKey.currentState!.validate();
          }
        },
      );
}
