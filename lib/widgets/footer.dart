import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1.0,
          color: Palette.primary.withOpacity(0.5),
        ),
        ResponsiveBuilder(
          builder: (context, sizingInformation) {
            bool isDesktop = sizingInformation.isDesktop;
            return Padding(
              padding: EdgeInsets.only(
                top: 22.0,
                bottom: isDesktop ? 40.0 : 30.0,
              ),
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                mainAxisSize: isDesktop ? MainAxisSize.max : MainAxisSize.min,
                children: [
                  Flex(
                    direction: isDesktop ? Axis.horizontal : Axis.vertical,
                    children: [
                      Text(
                        '© ${DateTime.now().year}',
                        style: const TextStyle(color: Palette.primary),
                      ),
                      isDesktop
                          ? const SizedBox(width: 4.0)
                          : const SizedBox(height: 10.0),
                      isDesktop
                          ? const Text(
                              '  •  ',
                              style: TextStyle(color: Palette.primary),
                            )
                          : const SizedBox.shrink(),
                      const Text(
                        'All rights reserved',
                        style: TextStyle(color: Palette.primary),
                      ),
                    ],
                  ),
                  isDesktop
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 10.0),
                  Text(
                    developedBy,
                    style: const TextStyle(color: Palette.primary),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
