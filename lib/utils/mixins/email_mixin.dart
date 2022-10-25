import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';

mixin EmailMixin on ChangeNotifier {
  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    validateEmail();
  }

  String? _emailError = '';
  String? get emailError => _emailError;
  bool get emailHasError => !_emailError.isNullOrWhiteSpace;

  void validateEmail() {
    try {
      _emailError = null;
      if (email.isNullOrWhiteSpace) {
        _emailError = 'E-Mel perlu diisi';
        return;
      }
      if (!email.isEmail) {
        _emailError = 'E-Mel tidak sah';
        return;
      }
    } finally {
      notifyListeners();
    }
  }
}
