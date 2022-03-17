import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      padding: const EdgeInsets.symmetric(horizontal: Doubles.horizontalMargin),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(Images.gradient),
        ),
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Padding(padding: EdgeInsets.only(top: 28.0), child: Header()),
              Padding(padding: EdgeInsets.only(top: 60.0), child: HeroText()),
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: InputSection(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.0, bottom: 40.0),
                child: GenerateButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
