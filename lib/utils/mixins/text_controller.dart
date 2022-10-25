import 'package:flutter/material.dart';

mixin TextControllerMixin on ChangeNotifier {
  bool _updateTextController = false;

  bool get updateTextController => _updateTextController;

  @protected
  void updateText(void Function() update) {
    update();
    _updateTextController = true;
  }

  @protected
  Future<void> updateTextAsync(Future<void> Function() update) async {
    await update();
    _updateTextController = true;
  }

  @protected
  void validateText(void Function() validate) {
    _updateTextController = false;
    validate();
  }

}
