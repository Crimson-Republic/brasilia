import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';
import 'package:flutter_color/flutter_color.dart';

class ColorController extends GetxController {
  var foregroundOpacity = 100.obs;

  var foreground = 'FF0000'.obs;
  var background = 'FFFFFF'.obs;
  var finalColor = '9E938C'.obs;

  // F40FF9

  var copiedToClipboard = false.obs;

  var generatedColor = ''.obs;

  generateColor() {
    double opacity = 1.0;
    if (foregroundOpacity.toInt() > 100) {
      opacity = foregroundOpacity.value.toInt() / 100;
      print('If');
      print(opacity);
    } else {
      opacity = foregroundOpacity.value.toInt() / 100;

      print('Else');
      print(opacity);
    }
    final foregroundColor = int.parse('0xFF${foreground.value}');
    final backgroundColor = int.parse('0xFF${background.value}');
    var finalColor =
        Color(foregroundColor).mix(Color(backgroundColor), opacity);
    generatedColor.value =
        finalColor.toString().split('ff').last.substring(0, 6);
    print(finalColor.toString());
    print(finalColor.toString());
    print(generatedColor.toString());
  }
}
