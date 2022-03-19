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
              Obx(
                () => Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    // color: colorController.foreground.isEmpty
                    //     ? const Color(0xFF9E938C).withOpacity(
                    //         colorController.foregroundOpacity.value > 100
                    //             ? 1.0
                    //             : colorController.foregroundOpacity.value / 100,
                    //       )
                    //     : Color(
                    //         int.parse(
                    //           '0xFF${colorController.foreground.value.split('#').last}',
                    //         ),
                    //       ).withOpacity(
                    //         colorController.foregroundOpacity.value > 100
                    //             ? 1.0
                    //             : colorController.foregroundOpacity.value / 100,
                    //       ),
                    color: colorController.foregroundColor(),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                width: 95.0,
                child: Obx(
                  () => TextField(
                    maxLength: colorController.foreground.value.startsWith('#')
                        ? 7
                        : 6,
                    autofocus: true,
                    autocorrect: false,
                    cursorColor: Palette.primary,
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Palette.primary,
                    ),
                    onChanged: (value) {
                      if (value.startsWith('#')) {
                        colorController.foreground.value =
                            value.trim().substring(0, 6);
                      } else {
                        colorController.foreground.value =
                            value.trim().substring(0, 5);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '9E938C',
                      border: InputBorder.none,
                      counter: const SizedBox.shrink(),
                      hintStyle: TextStyle(
                        fontSize: 24.0,
                        color: Palette.primary.withOpacity(0.2),
                      ),
                    ),
                  ),
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
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        colorController.foregroundOpacity.value =
                            int.parse(value.trim());
                      } else {
                        colorController.foregroundOpacity.value = 100;
                      }
                    },
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
}
