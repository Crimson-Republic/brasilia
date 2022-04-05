import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class BackgroundColor extends StatelessWidget {
  BackgroundColor({Key? key}) : super(key: key);

  final ColorController colorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Background',
          style: TextStyle(color: Palette.primary),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 86.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Palette.primary),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GetBuilder<ColorController>(
                builder: ((controller) {
                  return Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: controller.background.isEmpty
                          ? const Color(0xFF9E938C)
                          : resolveColor(),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  );
                }),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                width: 95.0,
                child: GetBuilder<ColorController>(
                  builder: (controller) {
                    return TextField(
                      autocorrect: false,
                      cursorColor: Palette.primary,
                      maxLength: controller.backgroundStartsWithHash ? 7 : 6,
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Palette.primary,
                      ),
                      onChanged: (value) => onBackgroundFieldChange(value),
                      decoration: InputDecoration(
                        hintText: 'FFFFFF',
                        border: InputBorder.none,
                        counter: const SizedBox.shrink(),
                        hintStyle: TextStyle(
                          fontSize: 24.0,
                          color: Palette.primary.withOpacity(0.2),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color resolveColor() {
    try {
      return Color(
        int.parse(
          '0xFF${colorController.background.split('#').last}',
        ),
      );
    } catch (error) {
      return const Color(0xFFFFFFFF);
    }
  }

  void onBackgroundFieldChange(String value) {
    if (value.startsWith('#')) {
      colorController.background = value.trim().substring(1);
      colorController.setBackgroundStartsWithHash(true);
    } else {
      colorController.background = value.trim();
      colorController.updateBackground(value);
      colorController.setBackgroundStartsWithHash(false);
    }
  }
}
