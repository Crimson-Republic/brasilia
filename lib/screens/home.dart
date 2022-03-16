import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        child: SvgPicture.asset(Images.gradient),
      ),
    );
  }
}
