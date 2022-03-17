import 'package:brasilia/shared/exports.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1.0,
          color: Palette.primary.withOpacity(0.5),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 22.0, bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                copyrightStatement,
                style: const TextStyle(color: Palette.primary),
              ),
              Text(
                developedBy,
                style: const TextStyle(color: Palette.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
