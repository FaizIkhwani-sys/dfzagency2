import 'package:dfzagency/dfz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  // Future<bool> saveUser(ProfilUser user) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   prefs.setString('email', "${user.email}");
  //   prefs.setString('phone', "${user.noPhone}");
  //   prefs.setString('nama', "${user.nama}");
  //   prefs.setString('dob', "${user.dob}");
  //   prefs.setString('token', "${user.firebaseToken}");
  //   prefs.setString('idProfil', "${user.id}");
  //
  //   return prefs.commit();
  // }

  // Future<ProfilUser> getUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   String? email = prefs.getString("email");
  //   String? phone = prefs.getString("phone");
  //   String? nama = prefs.getString("nama");
  //   String? token = prefs.getString("token");
  //   String? dob = prefs.getString("dob");
  //   String? idProfil = prefs.getString("idProfil");
  //
  //   return ProfilUser(
  //       email: email,
  //       noPhone: phone,
  //       nama: nama,
  //       firebaseToken: token,
  //       dob: dob,
  //       id: idProfil);
  // }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('nama');
    prefs.remove('email');
    prefs.remove('phone');
    prefs.remove('token');
    prefs.remove('dob');
    prefs.remove('idProfil');
    prefs.remove('DeviceId');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = "${prefs.getString("token")}";
    return token;
  }
}
