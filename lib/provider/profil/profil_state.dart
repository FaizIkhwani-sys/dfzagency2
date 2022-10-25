import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';

class ProfilState extends ChangeNotifier
    with TextControllerMixin,
        NameMixin, PhoneMixin, EmailMixin {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _address1;
  String? get address1 => _address1;
  set address1(String? value) {
    _address1 = value;
    notifyListeners();
  }

  String? _address2;
  String? get address2 => _address2;
  set address2(String? value) {
    _address2 = value;
    notifyListeners();
  }

  String? _address3;
  String? get address3 => _address3;
  set address3(String? value) {
    _address3 = value;
    notifyListeners();
  }

  String? _postcode;
  String? get postcode => _postcode;
  set postcode(String? value) {
    _postcode = value;
    notifyListeners();
  }

  String _namaPekerjaan = '';
  String get namaPekerjaan => _namaPekerjaan;
  set namaPekerjaan(String value) {
    _namaPekerjaan = value;
    notifyListeners();
  }

  String _dataConvert='';
  String get dataConvert => _dataConvert;
  set dataConvert(String value) {
    _dataConvert = value;
  }

  String? _addressError1 = '';
  String? get addressError1 => _addressError1;
  bool get addressHasError1 => !_addressError1.isNullOrWhiteSpace;

  String? _addressError2 = '';
  String? get addressError2 => _addressError2;
  bool get addressHasError2 => !_addressError2.isNullOrWhiteSpace;

  String? _addressError3 = '';
  String? get addressError3 => _addressError3;
  bool get addressHasError3 => !_addressError3.isNullOrWhiteSpace;

  String? _postcodeError = '';
  String? get postcodeError => _postcodeError;
  bool get postcodeHasError => !_postcodeError.isNullOrWhiteSpace;

  String? _pekerjaanError;
  String? get pekerjaanError => _pekerjaanError;
  bool get pekerjaanHasError => !_pekerjaanError.isNullOrWhiteSpace;


  validateAddress1() {
    try {
      _addressError1 = null;
      if (address1.isNullOrWhiteSpace) {
        _addressError1 = 'Alamat perlu diisi';
      }
    } finally {
      notifyListeners();
    }
  }

  validateAddress2() {
    try {
      _addressError2 = null;
      if (address2.isNullOrWhiteSpace) {
        _addressError2 = 'Alamat perlu diisi';
      }
    } finally {
      notifyListeners();
    }
  }

  validateAddress3() {
    try {
      _addressError3 = null;
      if (address3.isNullOrWhiteSpace) {
        _addressError3 = 'Alamat perlu diisi';
      }
    } finally {
      notifyListeners();
    }
  }

  validatePekerjaan() {
    try {
      _pekerjaanError = null;
      if (namaPekerjaan.isNullOrWhiteSpace) {
        _pekerjaanError = 'Sila Pilih Pekerjaan Anda';
      }
    } finally {
      notifyListeners();
    }
  }

  validatePostcode() {
    try {
      _postcodeError = null;
      if (postcode.isNullOrWhiteSpace) {
        _postcodeError = 'Poskod perlu diisi';
      }
    } finally {
      notifyListeners();
    }
  }
}
