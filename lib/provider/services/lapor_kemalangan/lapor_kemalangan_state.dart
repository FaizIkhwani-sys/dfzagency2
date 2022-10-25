import 'package:dfzagency/dfz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LaporKemalanganState extends ChangeNotifier{


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _onTap = false;
  bool get onTap => _onTap;
  set onTap(bool value) {
    _onTap = value;
    notifyListeners();
  }

  String _bencanaType = "Banjir" ; // dropdown jenis pemilikan
  String get bencanaType =>_bencanaType;

  set bencanaType(String value) {
    _bencanaType = value;
    notifyListeners();
  }

  String _others = '';
  String get others => _others;
  set others(String value) {
    _others = value;
    validateOthers();
  }

  String _report = '';
  String get report => _report;
  set report(String value) {
    _report = value;
    validateReport();
  }

  String _alamat = '';
  String get alamat => _alamat;
  set alamat(String value) {
    _alamat = value;
  }


  String _pilihMethodAlamat = '';
  String get pilihMethodAlamat => _pilihMethodAlamat;
  set pilihMethodAlamat(String value) {
    _pilihMethodAlamat = value;
    notifyListeners();
  }

  String _pilihExtraHelp = '';
  String get pilihExtraHelp => _pilihExtraHelp;
  set pilihExtraHelp(String value) {
    _pilihExtraHelp = value;
    notifyListeners();
  }

  String _pilihMethodAlamatError = '';
  String get pilihMethodAlamatError => _pilihMethodAlamatError;
  bool get pilihMethodAlamatHasError => !_pilihMethodAlamatError.isNullOrWhiteSpace;


  String? _bencanaTypeError;
  String get bencanaTypeError => _bencanaTypeError!;
  bool get bencanaTypeHasError => !_bencanaTypeError.isNullOrWhiteSpace;

  String _othersError = '';
  String get othersError => _othersError;
  bool get othersHasError => !_othersError.isNullOrWhiteSpace;

  String _reportError = '';
  String get reportError => _reportError;
  bool get reportHasError => !_reportError.isNullOrWhiteSpace;

  void validateOthers() {
    try {
      _othersError = '';
      if (others.isNullOrWhiteSpace) {
        _othersError = 'Laporan bencana tidak boleh ditinggalkan kosong';
      }
    } finally {
      notifyListeners();
    }
  }

  void validateReport() {
    try {
      _reportError = '';
      if (report.isNullOrWhiteSpace) {
        _reportError = 'Laporan bencana tidak boleh ditinggalkan kosong';
      }
    } finally {
      notifyListeners();
    }
  }

  void validateAll(){
    if(others == 'Lain-Lain') validateOthers();
    validateReport();
  }

  String _lat = "";
  String get lat => _lat;
  set lat(String value) {
    _lat = value;
    notifyListeners();
  }

  String _long = "";
  String get long => _long;
  set long(String value) {
    _long = value;
    notifyListeners();
  }

  getCurrentLocation() async {
    _isLoading = true;
    try {
      final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _lat = location.latitude.toString();
      _long = location.longitude.toString();

      // getPrayer();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}