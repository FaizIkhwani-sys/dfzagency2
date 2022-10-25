import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPageState extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
  }

  String? _nama;
  String? get nama => _nama;

  String? _email;
  String? get email => _email;

  String? _phone;
  String? get phone => _phone;

  String? _idProfil;
  String? get idProfil => _idProfil;

  String? _token;
  String? get token => _token;

  bool? _seen;
  bool? get seen => _seen;



  void initApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3), () async {
      await AppRoute.pushReplacement(context, const HomePage());
    });

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // getLocation();
    // _seen = prefs.getBool('seen') ?? false;
    // _email = prefs.getString("email");
    // _nama = prefs.getString("nama");
    // _token = await FirebaseMessaging.instance.getToken();
    // await prefs.setString("firebaseToken", "$token");
    // print(token);
    // print(" nama: $nama, email: $email");
    // flutterBlueFunction();
    //
    // if (seen == true) {
    //   await Future.delayed(const Duration(seconds: 3), () async {
    //     if (email == null) {
    //       await AppRoute.pushReplacement(context, const FirstPage());
    //     } else {
    //       await AppRoute.pushReplacement(context, const HomePage());
    //     }
    //   });
    // } else {
    //   await prefs.setBool('seen', true);
    //   await Future.delayed(const Duration(seconds: 3), () async {
    //     await AppRoute.pushReplacement(context, const IntroPage());
    //   });
    }
  }

