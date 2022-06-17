import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../constants/valid_email_domains.dart';

class EmailField extends HookWidget {
  const EmailField({Key? key, required this.fieldKey}) : super(key: key);

  final GlobalKey<FormFieldState> fieldKey;

  @override
  Widget build(BuildContext context) => Focus(
        child: TextFormField(
          key: fieldKey,
          validator: _validateEmail,
          autofillHints: const [AutofillHints.email],
          decoration: const InputDecoration(
            labelText: 'Email',
            // An empty helperText prevents field from changing height
            // when an error is shown:
            helperText: '',
            prefixIcon: Icon(Icons.email),
          ),
        ),
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            fieldKey.currentState!.validate();
          }
        },
      );
}

/// If genericResponse is supplied as a non empty string, it becomes the
/// only error report ever returned and replaces all other errors.
String? _validateEmail(String? email, [String? genericResponse]) {
  // stackoverflow.com/questions/16800540:
  final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final RegExp nonASCIIRegExp = RegExp('[^\x00-\x7F]');
  final RegExp firstDomainCharRegExp = RegExp('[^a-zA-Z0-9]');
  const int minLength = 8;
  const int maxLength = 255;

  if (email == null) {
    return genericResponse ?? 'Email can\'t be null';
  }
  if (email.isEmpty) {
    return genericResponse ?? 'Email can\'t be empty';
  } else {
    final length = email.length;
    if (length < minLength) {
      return genericResponse ??
          'Email must have at least $minLength characters';
    }

    if (length > maxLength) {
      return genericResponse ?? 'Email must have at most $maxLength characters';
    }

    if (nonASCIIRegExp.hasMatch(email)) {
      return genericResponse ?? 'Non ASCII characters found';
    }

    final emailParts = email.split('@');
    if (emailParts.length != 2) {
      return genericResponse ?? 'Not an email address - wrong parts';
    }

    final addr = emailParts[0];
    final domain = emailParts[1].toLowerCase();
    if (addr.contains('"') ||
        addr.contains("'") ||
        !emailRegExp.hasMatch(email)) {
      return genericResponse ?? 'Incorrectly formatted email address';
    }

    final firstDomainCharMatches = firstDomainCharRegExp.allMatches(domain[0]);
    if (firstDomainCharMatches.isNotEmpty) {
      return genericResponse ?? 'Not an email address - first domain char';
    }

    if (!validEmailDomains.contains(domain)) {
      return genericResponse ?? 'Not an email address - invalid domain';
    }
  }

  return null;
}
