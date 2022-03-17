import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class HomeController extends GetxController {
  var onResultPage = false.obs;
  final ScrollController scrollController = ScrollController();

  void scrollToBottom() {
    onResultPage.value = true;
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
