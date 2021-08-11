import 'package:gas_monitoring/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("displayName", user.email);
    prefs.setString("username", user.username);
    prefs.setString("firstName", user.firstName);
    prefs.setString("lastName", user.lastName);
    prefs.setString("token", user.token);
    //prefs.setString("renewalToken", user.renewalToken);
    //ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email");
    String username = prefs.getString("username");
    String firstName = prefs.getString("firstName");
    String lastName = prefs.getString("lastName");
    //String email = prefs.getString("email");
    //String imei = prefs.getString("imei");
    String token = prefs.getString("token");
    //String renewalToken = prefs.getString("renewalToken");

    return User(
        email: email,
        firstName: firstName,
        lastName: lastName,
        //email: email,
        //imei: imei,
        token: token);
    //renewalToken: renewalToken);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    prefs.remove("email");
    prefs.remove("firstName");
    prefs.remove("lastName");
    //prefs.remove("imei");
    prefs.remove("token");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
