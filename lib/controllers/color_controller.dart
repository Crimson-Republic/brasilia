import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';
import 'package:flutter_color/flutter_color.dart';

class ColorController extends GetxController {
  double foregroundOpacity = 1.0;

  String foreground = '9E938C';
  String background = 'FFFFFF';
  var generatedColor = ''.obs;

  bool foregroundStartsWithHash = false;
  bool backgroundStartsWithHash = false;

  var copiedToClipboard = false.obs;

  void setForegroundStartsWithHash(bool value) {
    foregroundStartsWithHash = value;
    update();
  }

  void setBackgroundStartsWithHash(bool value) {
    backgroundStartsWithHash = value;
    update();
  }

  void updateForegroundOpacity(double value) {
    foregroundOpacity = value;
    update();
  }

  void updateForeground(String value) {
    foreground = value;
    update();
  }

  void updateBackground(String value) {
    background = value;
    update();
  }

  void generateColor() {
    final foregroundColor = int.parse('0xFF$foreground');
    final backgroundColor = int.parse('0xFF$background');
    var finalColor = Color(foregroundColor).mix(
      Color(backgroundColor),
      1 - (foregroundOpacity),
    );
    generatedColor.value =
        finalColor.toString().toUpperCase().split('XFF').last.substring(0, 6);
  }
}
