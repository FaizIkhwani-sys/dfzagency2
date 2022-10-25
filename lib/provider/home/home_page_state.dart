import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePageState extends ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Future<void> requestPermission() async {
    if(await Permission.location.serviceStatus.isEnabled){
      Permission.location.request();
      print("done enable");
    }else{
      Permission.location.request();
    }
  }


}