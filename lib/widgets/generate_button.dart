import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class GenerateButton extends StatefulWidget {
  const GenerateButton({Key? key}) : super(key: key);

  @override
  State<GenerateButton> createState() => _GenerateButtonState();
}

class _GenerateButtonState extends State<GenerateButton> {
  bool generating = false;
  final HomeController homeController = Get.find();
  final ColorController colorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async => await generate(),
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: GetBuilder<ColorController>(
          builder: ((controller) {
            return ResponsiveBuilder(
              builder: (context, sizingInformation) {
                bool isDesktop = sizingInformation.isDesktop;
                return AnimatedContainer(
                  alignment: Alignment.center,
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: isDesktop ? 260.0 : double.infinity,
                  duration: const Duration(milliseconds: 800),
                  padding: EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: generating ? 14.0 : 68.0,
                  ),
                  decoration: BoxDecoration(
                    color: (controller.foreground.length == 6 &&
                            controller.foregroundTextController.text.isNotEmpty)
                        ? Palette.primary
                        : Colors.grey,
                    borderRadius:
                        BorderRadius.circular(generating ? 100.0 : 4.0),
                  ),
                  child: generating
                      ? const SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                            color: Colors.white,
                          ),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(Images.rocket),
                            const SizedBox(width: 12.0),
                            const Text(
                              'Generate',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                );
              },
            );
          }),
        ));
  }

  Future<void> generate() async {
    if ((colorController.foreground.length == 6 &&
        colorController.foregroundTextController.text.isNotEmpty)) {
      setState(() => generating = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => generating = false);
      colorController.generateColor();
      colorController.copiedToClipboard.value = false;
      await Future.delayed(const Duration(seconds: 1));
      homeController.scrollToBottom();
    }
  }
}
