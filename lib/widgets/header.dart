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
        MouseRegion(
          onEnter: (event) => setState(() => hovering = true),
          onExit: (event) => setState(() => hovering = false),
          child: InkWell(
            onTap: () {},
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                border: Border.all(color: Palette.primary),
                color: hovering ? Palette.primary : Colors.transparent,
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Text(
                'Contact Developers',
                style: TextStyle(
                  // fontSize: 16.0,
                  color: hovering ? Colors.white : Palette.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
