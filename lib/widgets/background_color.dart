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
              Obx(
                () => Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: colorController.background.isEmpty
                        ? const Color(0xFF9E938C)
                        : Color(
                            int.parse(
                              '0xFF${colorController.background.value}',
                            ),
                          ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                width: 95.0,
                child: TextField(
                  maxLength: 6,
                  autocorrect: false,
                  cursorColor: Palette.primary,
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Palette.primary,
                  ),
                  onChanged: (value) {
                    colorController.background.value = value;
                  },
                  decoration: const InputDecoration(
                    hintText: '9E938C',
                    border: InputBorder.none,
                    counter: SizedBox.shrink(),
                    hintStyle: TextStyle(
                      fontSize: 24.0,
                      color: Palette.primary,
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
