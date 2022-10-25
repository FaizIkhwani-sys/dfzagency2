extension StringExtensions on String? {
  bool get isNullOrWhiteSpace {
    return this == null || this!.trim().isEmpty;
  }
}

extension EmailExtensions on String? {
  bool get isEmail {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(this!);
  }
}

extension CapExtension on String {
  String get inCaps =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get capitalizeFirstofEach {
    if (isNullOrWhiteSpace) return '';
    return toLowerCase()
        .replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.inCaps)
        .join(' ');
  }
}

extension PhoneExtensions on String? {
  bool get isPhoneNumber {
    if (this!.length > 9 && this!.length < 12) {
      return true;
    } else {
      return false;
    }
  }
}
