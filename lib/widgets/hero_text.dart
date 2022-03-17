import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class HeroText extends StatelessWidget {
  const HeroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              fastestWay,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Palette.primary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            justEnter.toUpperCase(),
            style: const TextStyle(fontSize: 20.0, color: Palette.primary),
          ),
        ),
      ],
    );
  }
}
