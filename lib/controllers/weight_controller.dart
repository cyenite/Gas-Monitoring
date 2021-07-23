import 'package:get/get.dart';

class WeightController extends GetxController {
  final weight = 0.0.obs;

  setWeight(double w) {
    weight(w);
  }
}
