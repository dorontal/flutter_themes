import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AboutField extends HookWidget {
  const AboutField({Key? key, required this.globalKey}) : super(key: key);

  final GlobalKey<FormFieldState> globalKey;

  @override
  Widget build(BuildContext context) => Focus(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            key: globalKey,
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
            globalKey.currentState!.validate();
          }
        },
      );
}
