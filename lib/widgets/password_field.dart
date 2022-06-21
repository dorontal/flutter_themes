import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordField extends HookWidget {
  const PasswordField({Key? key, required this.globalKey}) : super(key: key);

  final GlobalKey<FormFieldState> globalKey;

  @override
  Widget build(BuildContext context) {
    final obscureTextState = useState(true);

    return Focus(
      child: TextFormField(
          key: globalKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: _validatePassword,
          autofillHints: const [AutofillHints.password],
          obscureText: obscureTextState.value,
          decoration: InputDecoration(
            labelText: 'Password',
            // An empty helperText prevents field from changing height
            // when an error is shown:
            helperText: '',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () => obscureTextState.value = !obscureTextState.value,
              icon: Icon(
                obscureTextState.value
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
          )),
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          globalKey.currentState!.validate();
        }
      },
    );
  }
}

String? _validatePassword(String? password, [String? genericResponse]) {
  const int minLength = 8;
  const int maxLength = 32;
  final RegExp nonASCIIRegExp = RegExp('[^\x00-\x7F]');
  final RegExp hasLowercaseRegExp = RegExp(r'[a-z]+');
  final RegExp hasUppercaseRegExp = RegExp(r'[A-Z]+');
  final RegExp hasDigitsRegExp = RegExp(r'[0-9]+');

  if (password == null || password.isEmpty) {
    return genericResponse ?? 'Please enter a password';
  } else {
    final length = password.length;
    if (length < minLength) {
      return genericResponse ??
          'Password must have at least $minLength characters';
    }
    if (length > maxLength) {
      return genericResponse ??
          'Password must have at most $maxLength characters';
    }
    if (nonASCIIRegExp.hasMatch(password)) {
      return genericResponse ?? 'Password must be all ASCII characters';
    }
    if (!hasLowercaseRegExp.hasMatch(password)) {
      return genericResponse ??
          'Password must have at least one lowercase character';
    }
    if (!hasUppercaseRegExp.hasMatch(password)) {
      return genericResponse ??
          'Password must have at least one uppercase character';
    }
    if (!hasDigitsRegExp.hasMatch(password)) {
      return genericResponse ?? 'Password must contain at least one number';
    }
  }
  return null;
}
