import 'package:brasilia/shared/exports.dart';
import 'package:flutter/material.dart';

class InputSection extends StatelessWidget {
  const InputSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isDesktop = sizingInformation.isDesktop;
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 34.0,
            horizontal: isDesktop ? 56.0 : 20.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.white),
          ),
          child: Flex(
            mainAxisSize: MainAxisSize.min,
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            children: [
              Flexible(child: ForegroundColor()),
              isDesktop
                  ? const SizedBox(width: 40.0)
                  : const SizedBox(height: 40.0),
              Flexible(child: BackgroundColor()),
            ],
          ),
        );
      },
    );
  }
}
