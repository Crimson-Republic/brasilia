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
  final FinalColorController finalColorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => generateColor(),
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(milliseconds: 800),
        padding: EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: generating ? 14.0 : 68.0,
        ),
        decoration: BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.circular(generating ? 100.0 : 4.0),
        ),
        child: generating
            ? const SizedBox(
                height: 24.0,
                width: 24.0,
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
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> generateColor() async {
    setState(() => generating = true);
    await Future.delayed(const Duration(seconds: 4));
    setState(() => generating = false);
    finalColorController.copiedToClipboard.value = false;
    await Future.delayed(const Duration(seconds: 1));
    homeController.scrollToBottom();
  }
}
