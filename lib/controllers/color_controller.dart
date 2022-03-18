import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';
import 'package:flutter_color/flutter_color.dart';

class ColorController extends GetxController {
  var foregroundOpacity = 100.obs;

  var foreground = ''.obs;
  var background = 'FFFFFF'.obs;
  var generatedColor = ''.obs;

  var copiedToClipboard = false.obs;

  void generateColor() {
    late double opacity;
    if (foregroundOpacity.toInt() > 100) {
      opacity = 0;
    } else {
      opacity = 1 - (foregroundOpacity.value.toInt() / 100);
    }
    final foregroundColor = int.parse('0xFF${foreground.value}');
    final backgroundColor = int.parse('0xFF${background.value}');
    var finalColor =
        Color(foregroundColor).mix(Color(backgroundColor), opacity);
    generatedColor.value =
        finalColor.toString().toUpperCase().split('XFF').last.substring(0, 6);
  }
}
