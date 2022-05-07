import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordField extends HookWidget {
  PasswordField({Key? key}) : super(key: key);

  final _passwordFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final _obscureTextState = useState(true);

    return Focus(
      child: TextFormField(
          key: _passwordFieldKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: _validatePassword,
          autofillHints: const [AutofillHints.password],
          obscureText: _obscureTextState.value,
          decoration: InputDecoration(
            labelText: 'Password',
            // An empty helperText prevents field from changing height
            // when an error is shown:
            helperText: '',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () =>
                  _obscureTextState.value = !_obscureTextState.value,
              icon: Icon(
                _obscureTextState.value
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
          )),
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          _passwordFieldKey.currentState!.validate();
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
  const String invalidMessage01 = 'Please enter a password';
  const String invalidMessage02 =
      'Password must have at least $minLength characters';
  const String invalidMessage03 =
      'Password must have at most $maxLength characters';
  const String invalidMessage04 = 'Password must be all ASCII characters';
  const String invalidMessage05 =
      'Password must have at least one lowercase character';
  const String invalidMessage06 =
      'Password must have at least one uppercase character';
  const String invalidMessage07 = 'Password must contain at least one number';

  if (password == null || password.isEmpty) {
    return genericResponse ?? invalidMessage01;
  } else {
    final length = password.length;
    if (length < minLength) {
      return genericResponse ?? invalidMessage02;
    }
    if (length > maxLength) {
      return genericResponse ?? invalidMessage03;
    }
    if (nonASCIIRegExp.hasMatch(password)) {
      return genericResponse ?? invalidMessage04;
    }
    if (!hasLowercaseRegExp.hasMatch(password)) {
      return genericResponse ?? invalidMessage05;
    }
    if (!hasUppercaseRegExp.hasMatch(password)) {
      return genericResponse ?? invalidMessage06;
    }
    if (!hasDigitsRegExp.hasMatch(password)) {
      return genericResponse ?? invalidMessage07;
    }
  }
  return null;
}
