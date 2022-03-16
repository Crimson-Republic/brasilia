import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: Doubles.horizontalMargin),
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage(Images.gradient),
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 28.0),
              child: Header(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    fastestWay,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 56.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                justEnter.toUpperCase(),
                style: const TextStyle(fontSize: 20.0, color: Palette.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'OPA-CITY',
          style: TextStyle(
            fontSize: 20.0,
            color: Palette.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(color: Palette.primary)),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: const Text(
            'Contact Developers',
            style: TextStyle(fontSize: 16.0, color: Palette.primary),
          ),
        ),
      ],
    );
  }
}
