import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasilia/shared/exports.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  final ColorController colorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.95,
      margin: const EdgeInsets.only(top: 60.0),
      padding: const EdgeInsets.symmetric(horizontal: Doubles.horizontalMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Result ✨',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Palette.primary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Container(
                width: Get.width * 0.3,
                margin: const EdgeInsets.only(top: 40.0),
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(3, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Obx(
                  () => Column(
                    children: [
                      Container(
                        height: Get.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(
                            int.parse('0xFF${colorController.generatedColor}'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '#${colorController.generatedColor.value}'
                                  .toUpperCase(),
                              style: const TextStyle(
                                fontSize: 22.0,
                                color: Palette.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Obx(
                              () => colorController.copiedToClipboard.value
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.check, color: Colors.green),
                                        SizedBox(width: 4.0),
                                        Text(
                                          'Copied',
                                          style:
                                              TextStyle(color: Palette.primary),
                                        ),
                                      ],
                                    )
                                  : InkWell(
                                      hoverColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: SvgPicture.asset(Images.copy),
                                      onTap: () async {
                                        colorController
                                            .copiedToClipboard.value = true;
                                        await Clipboard.setData(
                                          ClipboardData(
                                            text: colorController
                                                .generatedColor.value,
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Footer(),
        ],
      ),
    );
  }
}
