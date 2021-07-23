import 'package:get/get.dart';

class WeightController extends GetxController {
  final weight = 0.0.obs;
  final volume = 0.0.obs;
  final volumePercentage = 0.0.obs;

  setWeight(double w) {
    weight(w);
    setVolume(w);
  }

  setVolume(double v) {
    volume(v);
    volumePercentage(v);
  }
}
