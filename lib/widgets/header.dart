import 'package:flutter/material.dart';
import 'package:brasilia/shared/exports.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'OPA-CITY',
          style: TextStyle(
            fontSize: 20.0,
            color: Palette.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        ResponsiveBuilder(
          builder: (context, sizingInformation) {
            bool isDesktop = sizingInformation.isDesktop;
            return isDesktop
                ? MouseRegion(
                    onEnter: (event) => setState(() => hovering = true),
                    onExit: (event) => setState(() => hovering = false),
                    child: InkWell(
                      onTap: () async => await openMail(),
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          border: Border.all(color: Palette.primary),
                          color:
                              hovering ? Colors.transparent : Palette.primary,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 24.0),
                        child: Text(
                          'Contact Developers',
                          style: TextStyle(
                            // fontSize: 16.0,
                            color: hovering ? Palette.primary : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () async => await openMail(),
                    child: const Icon(
                      Icons.contact_mail,
                      color: Palette.primary,
                    ),
                  );
          },
        ),
      ],
    );
  }

  Future<void> openMail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'republic.crimson@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'cc': 'raymarfo184@gmail.com, othnielussher16@gmail.com',
        // 'cc': 'othnielussher16@gmail.com',
      }),
    );

    await launch(emailLaunchUri.toString());
  }
}
