import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Obx(
            () => ListView(
              physics: homeController.onResultPage.value
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              controller: homeController.scrollController,
              children: [const FirstPage(), ResultPage()],
            ),
          );
        },
      ),
    );
  }
}
