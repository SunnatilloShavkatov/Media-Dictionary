import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  bool isLoading = false;

  List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y"
  ];

  void setLoading(bool value) {
    isLoading = value;
    update();
  }
}
