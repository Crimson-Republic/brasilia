import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class ForegroundColor extends StatelessWidget {
  ForegroundColor({Key? key}) : super(key: key);

  final ForegroundColorController foregroundColorController = Get.find();

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
                    color: foregroundColorController.hexValue.isEmpty
                        ? Colors.amberAccent
                        : Color(
                            int.parse(
                              '0xFF${foregroundColorController.hexValue.value}',
                            ),
                          ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                width: 85.0,
                child: TextField(
                  maxLength: 6,
                  autofocus: true,
                  autocorrect: false,
                  cursorColor: Palette.primary,
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Palette.primary,
                  ),
                  // onEditingComplete: () {},
                  onChanged: (value) {
                    foregroundColorController.hexValue.value = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'F09595',
                    border: InputBorder.none,
                    counter: SizedBox.shrink(),
                    hintStyle: TextStyle(
                      fontSize: 24.0,
                      color: Palette.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24.0),
              Flexible(
                child: Container(
                  width: 100.0,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 28,
                  ),
                  child: const TextField(
                    maxLength: 2,
                    autocorrect: false,
                    cursorColor: Palette.primary,
                    style: TextStyle(fontSize: 20.0, color: Palette.primary),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '40%',
                      border: InputBorder.none,
                      counter: SizedBox.shrink(),
                      contentPadding: EdgeInsets.zero,
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Palette.primary,
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
