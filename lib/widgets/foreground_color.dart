import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class ForegroundColor extends StatelessWidget {
  ForegroundColor({Key? key}) : super(key: key);

  final ColorController colorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Foreground',
          style: TextStyle(color: Palette.primary),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 22.0,
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
                      borderRadius: BorderRadius.circular(2.0),
                      color: controller.foreground.isEmpty
                          ? const Color(0xFF9E938C).withOpacity(
                              controller.foregroundOpacity,
                            )
                          : resolveColor(),
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
                      autofocus: true,
                      autocorrect: false,
                      cursorColor: Palette.primary,
                      maxLength: controller.foregroundStartsWithHash ? 7 : 6,
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Palette.primary,
                      ),
                      onChanged: (value) => onHexFieldChange(value),
                      decoration: InputDecoration(
                        hintText: '9E938C',
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
              const SizedBox(width: 24.0),
              Flexible(
                child: Container(
                  width: 110.0,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 28.0,
                  ),
                  child: TextField(
                    maxLength: 3,
                    autocorrect: false,
                    cursorColor: Palette.primary,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Palette.primary,
                    ),
                    onChanged: (value) => onOpacityChange(value),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '100%',
                      border: InputBorder.none,
                      counter: const SizedBox.shrink(),
                      contentPadding: EdgeInsets.zero,
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Palette.primary.withOpacity(0.2),
                      ),
                    ),
                  ),
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
          '0xFF${colorController.foreground.split('#').last}',
        ),
      ).withOpacity(colorController.foregroundOpacity);
    } catch (error) {
      return const Color(0xFF9E938C);
    }
  }

  void onHexFieldChange(String value) {
    if (value.startsWith('#')) {
      colorController.foreground = value.trim().substring(1);
      colorController.setForegroundStartsWithHash(true);
    } else {
      colorController.foreground = value.trim();
      colorController.updateForeground(value);
      colorController.setForegroundStartsWithHash(false);
    }
  }

  void onOpacityChange(String value) {
    try {
      if (value.isNotEmpty) {
        double opacity = (int.parse(value.trim()) / 100);
        colorController.updateForegroundOpacity(opacity);
      } else {
        colorController.updateForegroundOpacity(1.0);
      }
    } catch (error) {
      colorController.updateForegroundOpacity(1.0);
    }
  }
}
