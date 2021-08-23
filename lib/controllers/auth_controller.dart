import 'dart:async';
import 'dart:convert';

import 'package:gas_monitoring/config/app_url.dart';
import 'package:gas_monitoring/models/user_model.dart';
import 'package:gas_monitoring/services/user_preference.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthController extends GetxController {
  Rx<bool> isLoggedIn = true.obs;
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  set setLoggedInStatus(Status status) => _loggedInStatus;
  set setRegisteredInStatus(Status status) => _registeredInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };
    print("Response Initiated");
    Response response = await post(
      Uri.parse(AppUrl.login),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );
    print(email);
    print(response);
    print("Response Received");
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      //var userData = responseData['data'];
      User authUser = User.fromJson(responseData);
      UserPreferences().saveUser(authUser);
      print(responseData);
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> getToken(String email, String password) async {
    var result;
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };
    print("Response Initiated");
    Response response = await post(
      Uri.parse(AppUrl.login),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );
    print(email);
    print(response);
    print("Response Received");
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      //var userData = responseData['data'];
      User authUser = User.fromJson(responseData);
      UserPreferences().saveUser(authUser);
      print(responseData);
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register(
      {String firstName,
      String lastName,
      String email,
      String password,
      String phoneNumber}) async {
    final Map<String, dynamic> registrationData = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "userName": "$firstName $lastName",
      "password": password,
      "confirmPassword": password,
      "phoneNumber": phoneNumber,
      "activateUser": true,
      "autoConfirmEmail": true
    };

    return await post(Uri.parse(AppUrl.register),
            body: json.encode(registrationData),
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      var userData = responseData['data'];
      User authUser = User.fromJson(responseData);
      UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> verifyPass(String email, String password) async {
    var result;
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };
    Response response = await post(
      Uri.parse(AppUrl.login),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );
    print(email);
    print(response);
    print("Response Received");

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      //var userData = responseData['data'];
      User authUser = User.fromJson(responseData);
      UserPreferences().saveUser(authUser);
      print(responseData);
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
