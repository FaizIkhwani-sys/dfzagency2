import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';

mixin PasswordMixin on ChangeNotifier {
  String? _password = '';
  String? get password => _password;
  set password(String? value) {
    _password = value;
    validatePassword();
  }

  String? _confirmPassword= '';
  String? get confirmPassword => _confirmPassword;
  set confirmPassword(String? value) {
    _confirmPassword = value;
    validateConfirmPassword();
  }

  String? _confirmPasswordError = '';
  String? get confirmPasswordError => _confirmPasswordError;
  bool get confirmPasswordHasError => !_confirmPasswordError.isNullOrWhiteSpace;

  String? _passwordError = '';
  String? get passwordError => _passwordError;
  bool get passwordHasError => !_passwordError.isNullOrWhiteSpace;

  void validatePassword() {
    try {
      _passwordError = null;
      if (password.isNullOrWhiteSpace) {
        _passwordError = 'Kata laluan perlu diisi';
      }
    } finally {
      notifyListeners();
    }
  }

  void validateConfirmPassword() {
    try {
      _confirmPasswordError = null;
      if (confirmPassword.isNullOrWhiteSpace) {
        _confirmPasswordError = 'Kata Laluan Perlu Diisi';
      } else if (confirmPassword != password) {
        _confirmPasswordError = 'Kata Laluan Tidak Sama';
      }
    } finally {
      notifyListeners();
    }
  }
}
