import 'package:brasilia/shared/exports.dart';
import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  const HeroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isDesktop = sizingInformation.isDesktop;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  fastestWay,
                  textAlign: TextAlign.center,
                  style: isDesktop
                      ? Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: Palette.primary,
                            fontWeight: FontWeight.w700,
                          )
                      : Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Palette.primary,
                            fontWeight: FontWeight.w700,
                          ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: isDesktop ? 20.0 : 16.0,
                left: isDesktop ? 0.0 : 20.0,
                right: isDesktop ? 0.0 : 20.0,
              ),
              child: Text(
                justEnter.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Palette.primary,
                  fontSize: isDesktop ? 20.0 : 14.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
