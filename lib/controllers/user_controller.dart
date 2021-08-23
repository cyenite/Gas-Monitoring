import 'package:gas_monitoring/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  User _user = new User();

  User get user => _user;

  void setUser(User user) {
    _user = user;
  }
}
