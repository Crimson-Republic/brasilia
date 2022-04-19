import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasilia/shared/exports.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  final ColorController colorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isDesktop = sizingInformation.isDesktop;
        return Container(
          margin: const EdgeInsets.only(top: 60.0),
          height: isDesktop ? Get.height * 0.95 : Get.height * 0.9,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop
                ? Doubles.horizontalMargin
                : Doubles.horizontalMarginMobile,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Result ✨',
                    style: TextStyle(
                      color: Palette.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: isDesktop ? 40.0 : 28.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    width: isDesktop ? Get.width * 0.3 : double.infinity,
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(3, 3),
                          color: Colors.grey.withOpacity(0.05),
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
                                int.parse(
                                    '0xFF${colorController.generatedColor.value}'),
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
                                colorController.copiedToClipboard.value
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                          SizedBox(width: 4.0),
                                          Text(
                                            'Copied',
                                            style: TextStyle(
                                                color: Palette.primary),
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
      },
    );
  }
}
