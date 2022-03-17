import 'package:brasilia/shared/exports.dart';
import 'package:flutter/material.dart';

class InputSection extends StatelessWidget {
  const InputSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 34.0,
        horizontal: 56.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: ForegroundColor()),
          const SizedBox(width: 40.0),
          Flexible(child: BackgroundColor()),
        ],
      ),
    );
  }
}
