import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';

mixin NameMixin on ChangeNotifier {
  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    validateName();
  }

  String? _nameError = '';
  String? get nameError => _nameError;
  bool get nameHasError => !_nameError.isNullOrWhiteSpace;

  void validateName() {
    try {
      _nameError = null;
      if (name.isNullOrWhiteSpace) {
        _nameError = 'Nama penuh perlu diisi';
      }
    } finally {
      notifyListeners();
    }
  }
}
