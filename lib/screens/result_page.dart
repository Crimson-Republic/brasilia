import 'package:brasilia/shared/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  final FinalColorController finalColorController = Get.find();

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
                              '0xFF${finalColorController.hexValue.value}',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '#${finalColorController.hexValue.value}',
                              style: const TextStyle(
                                fontSize: 22.0,
                                color: Palette.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Obx(
                              () => finalColorController.copiedToClipboard.value
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
                                        finalColorController
                                            .copiedToClipboard.value = true;
                                        await Clipboard.setData(
                                          ClipboardData(
                                            text: finalColorController
                                                .hexValue.value,
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 1.0,
                color: Palette.primary.withOpacity(0.5),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0, bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      copyrightStatement,
                      style: const TextStyle(color: Palette.primary),
                    ),
                    Text(
                      developedBy,
                      style: const TextStyle(color: Palette.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
